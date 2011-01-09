# 用来管理系统的菜单
module Irm
  module MenuManager
    class << self

      # 系统中所有菜单，以HASH形式保存
      def menus
        items[:menus]
      end
      # 系统中所有权限，以HASH形式保存
      def permissions
        items[:permissions]
      end

      # 所有权限编码，以HASH形式保存
      def permission_codes
        items[:permission_codes]
      end

      # 所有权限对应的菜单，以HASH形式保存
      def permission_menus
        items[:permission_menus]
      end

      #初始化菜单和权限缓存
      def reset_menu
        menus = Irm::Menu.enabled
        permissions = Irm::Permission.all
        menus_cache = {}
        permissions_cache = {}
        permission_codes_cache = {}

        menus.each do |m|
          # 子菜单项
          tmp_menu_entries = m.menu_entries.where("sub_menu_code IS NOT NULL").order(:display_sequence)
          menu_entries = []
          tmp_menu_entries.each do |tm|
            data = {:menu_entry_id=>tm.id,:sub_menu_code=>tm.sub_menu_code,:permission_code=>tm.permission_code,:display_flag=>tm.display_flag}
            tm.menu_entries_tls.each do |mt|
              data.merge!({mt.language.to_sym=>{:name=>mt.name,:description=>mt.description}})
            end
            menu_entries<<data
          end
          # 子权限项
          tmp_permission_entries = m.menu_entries.where("sub_menu_code IS NULL AND permission_code IS NOT NULL").order(:display_sequence)
          permission_entries = []
          tmp_permission_entries.each do |tp|
            data = {:menu_entry_id=>tp.id,:permission_code=>tp.permission_code,:display_flag=>tp.display_flag}
            tp.menu_entries_tls.each do |mt|
              data.merge!({mt.language.to_sym=>{:name=>mt.name,:description=>mt.description}})
            end
            permission_entries<<data
          end

          menu_data = {:menu_entries=>menu_entries,
                       :permission_entries=>permission_entries,
                       :menu_code=>m.menu_code,
                       :icon=>m.icon
                       }

          menus_cache.merge!({m.menu_code=>menu_data})
        end
        
        permissions.each do |p|
          permission_data={:id=>p.id,
                           :permission_code=>p.permission_code,
                           :permission_type => p.permission_type,
                           :page_controller=>p.page_controller,
                           :page_action=>p.page_action,
                           :options => {},
                           :status_code=>p.status_code
                          }
          permissions_tls = p.permissions_tls
          permissions_tls.each do |pt|
            permission_data.merge!({pt.language.to_sym=>{:name=>pt.name,:description=>pt.description}})
          end
          permissions_cache.merge!({p.permission_code=>permission_data})
          permission_codes_cache.merge!({Irm::Permission.url_key(p.page_controller,p.page_action)=>p.permission_code})
        end

        map do |m|
          m.merge!({:menus=>menus_cache,:permissions=>permissions_cache,:permission_codes=>permission_codes_cache})  
        end
        # 初始化权限对应的菜单
        setup_permission_menus

        rescue =>text
          puts("Init menu error:#{text}")
      end




      #通过controller,action取得permission hash
      def permission_by_url(controller,action)
        permission_code = permission_codes[Irm::Permission.url_key(controller,action)]
        permission = nil
        permission = permissions[permission_code].dup if permission_code
        permission
      end

      def menu_by_code(menu_code)
        menus[menu_code]
      end

      # 通过菜单编码取得子菜单项
      # 在返回子项前进行菜单子项的权限验证
      # must_permission_code 表示entry的permission_code不能为空，如果为空使用IRM_SETTING_COMMON填充
      def sub_entries_by_menu(menu_code,must_permission_code=false)
        sub_entries = []
        menu = menus[menu_code]
        menu[:menu_entries].each do |me|
          if(menus[me[:sub_menu_code]].nil?)
            Rails.logger.warn("Not exists menu:#{me[:sub_menu_code]} or permission:#{me[:permission_code]},Please check!")
            next
          end
          entries_options = {:menu_entry_id=>me[:menu_entry_id],
                             :menu_code => me[:sub_menu_code],
                             :entry_type=>"MENU",
                             :icon=>menu_icon(me[:sub_menu_code]),
                             :name=>me[::I18n.locale.to_sym][:name],
                             :description=>me[::I18n.locale.to_sym][:description],
                             :permission_code=>me[:permission_code]}
            entries_options.merge!({:permission_code=>"IRM_SETTING_COMMON"}) if must_permission_code&&entries_options[:permission_code].nil?
            show_options = menu_showable(me.merge(:permission_code=>entries_options[:permission_code]))
            sub_entries<< entries_options.merge!(show_options) if show_options&&me[:display_flag].eql?("Y")
        end
        menu[:permission_entries].each do |pe|
          if(permissions[pe[:permission_code]].nil?)
            Rails.logger.warn("Not exists  permission:#{pe[:permission_code]},Please check!")
            next
          end
          entries_options = {:menu_entry_id=>pe[:menu_entry_id],
                             :entry_type=>"PERMISSION",
                             :name=>pe[::I18n.locale.to_sym][:name],
                             :description=>pe[::I18n.locale.to_sym][:description],
                             :permission_code=>pe[:permission_code]}
          sub_entries<< entries_options.merge!(permission_url_options(pe[:permission_code])) if pe[:display_flag].eql?("Y")&&check_permission(pe[:permission_code])
        end
        sub_entries
      end

      # 确定菜单是否可显示
      def menu_showable(menu_entry)
        if(menu_entry[:permission_code]&&check_permission(menu_entry[:permission_code]))
          return permission_url_options(menu_entry[:permission_code])    
        else
          menu = menu_by_code(menu_entry[:sub_menu_code])
          if menu
            menu[:menu_entries].each do |me|
              showable = menu_showable(me)
              return showable if showable
            end

            menu[:permission_entries].each do |pe|
              return permission_url_options(pe[:permission_code]) if check_permission(pe[:permission_code])
            end
          end
        end
        false
      end

      # 检查permission的权限
      def check_permission(permission_code)
        return true if permission_code.nil?||permissions[permission_code].nil?
        permission = permissions[permission_code].dup
        Irm::PermissionChecker.allow_to_permission?(permission)
      end

      # 使用permission_code取得permission中的url 参数
      # is_permission 表示权限还是菜单
      def permission_url_options(permission_code)
        permission = permissions[permission_code]
        if permission
          {:page_controller=>permission[:page_controller],:page_action=>permission[:page_action]}
        else
          {}
        end  
      end

      #通过权限编辑取得菜单列表
      def parent_menus_by_permission(options={})
        menus =  permission_menus[Irm::Permission.url_key(options[:page_controller]||"irm/permissions",options[:page_action]||"index")]||[]
        return menus.dup unless menus.size==0
        (permission_menus[Irm::Permission.url_key(options[:page_controller]||"irm/permissions","index")]||[]).dup
      end

      # 通过菜单取得上层菜单列表
      def parent_menus_by_menu(menu_code)
        permission_parent_menus(menu_code) << menu_code
      end



      private
      #将数据加载至内存
      def map
        @items =Ironmine::STORAGE.get(:menu_manager_items)||{}
        if block_given?
          yield @items
        end
        Ironmine::STORAGE.put(:menu_manager_items,@items)
      end

      # 从内存中读取数据
      def items
        Ironmine::STORAGE.get(:menu_manager_items)||{}
      end

      def menu_icon(menu_code)
        menus[menu_code][:icon]
      end
      # 生成权限对应的菜单列表
      def setup_permission_menus
        permission_menus_cache = {}
        permissions.values.each do |p|
          permission_menus_cache.merge!({Irm::Permission.url_key(p[:page_controller],p[:page_action])=>permission_parent_menus(p[:permission_code])})
        end
        map do |m|
          m.merge!({:permission_menus=>permission_menus_cache})
        end
      end


      def permission_parent_menus(permission_code)
        menu_codes = []
        menu_code = parent_menu(permission_code)
        while menu_code
          menu_codes << menu_code
          menu_code = parent_menu(menu_code)
        end
        menu_codes.reverse
      end

      def parent_menu(pm_code)
        menus.values.each do |m|
          if(m[:menu_entries].detect{|me| me[:sub_menu_code].eql?(pm_code)}||m[:permission_entries].detect{|pe| pe[:permission_code].eql?(pm_code)})
            return m[:menu_code]
          else
            tme = m[:menu_entries].detect{|me| me[:permission_code].eql?(pm_code)}
            if tme
              return tme[:sub_menu_code]
            end
          end
        end
        nil
      end
    end
  end
end