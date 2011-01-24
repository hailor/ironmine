module Irm::RoleManager
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

      # 所有权限对应的上级菜单，以HASH形式保存
      def permission_menus
        items[:permission_menus]
      end

      # 所有菜单对应的上级菜单，以HASH形式保存
      def menu_menus
        items[:menu_menus]
      end

      #初始化菜单和权限缓存
      def reset_menu
        # 生成菜单缓存
        prepare_menu_cache
        # 生成权限缓存
        prepare_permission_cache
        # 初始化权限对应的菜单
        setup_permission_menus

        rescue =>text
          puts("Init menu error:#{text}")
      end



      # =====================================生成菜单缓存===============================================
      def prepare_menu_cache
        menus = Irm::Menu.enabled
        menus_cache = {}
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
        map do |m|
          m.merge!({:menus=>menus_cache})
        end
      end


      # =====================================生成权限缓存===============================================
      def prepare_permission_cache
        permissions = Irm::Permission.all
        permissions_cache = {}
        permission_codes_cache = {}
        permissions.each do |p|
          permission_data={:pid=>p.id,
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
          m.merge!({:permissions=>permissions_cache,:permission_codes=>permission_codes_cache})
        end
      end

      # =====================================生成权限的上层菜单，及菜单的上层菜单缓存===============================================
       # 生成权限对应的菜单列表
      def prepare_parent_menu
        permission_menus_cache = {}
        menu_menus_cache = {}
        map do |m|
          m.merge!({:permission_menus=>permission_menus_cache,:menu_menus=>menu_menus_cache})
        end
        top_menus.each do |m|
          expand_permission([m])
        end
      end

      # 取得系统中的顶级菜单
      # TODO 从角色表中取得角色对应的顶级菜单
      def top_menus
        Irm::MenuEntry.where("NOT EXISTS(SELECT 1 FROM #{Irm::MenuEntry.table_name} mea WHERE #{Irm::MenuEntry.table_name}.menu_code = mea.sub_menu_code)").
            select("#{Irm::MenuEntry.table_name}.menu_code").collect{|m| m.menu_code}.uniq
      end

      # 递归寻找菜单下的权限
      # 展开权限
      # menu_path 菜单路径
      def expand_permission(menu_path)
        # 复制路径
        temp_menu_path = menu_path.dup
        # 取得当前菜单编码
        current_menu_code = temp_menu_path.last
        # 取得当前菜单
        current_menu = menus[current_menu_code]
        return unless current_menu

        current_menu[:permission_entries].each do |pe|
          if(permissions[pe[:permission_code]].nil?)
            Rails.logger.warn("Not exists  permission:#{pe[:permission_code]},Please check!")
            next
          end
          merge_permission_menu({:permission_code=>pe[:permission_code],:path=>temp_menu_path})
        end
        current_menu[:menu_entries].each do |me|
          if(menus[me[:sub_menu_code]].nil?)
            Rails.logger.warn("Not exists menu:#{me[:sub_menu_code]} or permission:#{me[:permission_code]},Please check!")
            next
          end
          if(me[:permission_code]&&!permissions[me[:permission_code]].nil?)
            merge_permission_menu({:permission_code=>me[:permission_code],:path=>temp_menu_path+[me[:sub_menu_code]]})
          end
          merge_menu_menu({:sub_menu_code=>me[:sub_menu_code],:path=>temp_menu_path})
          expand_permission(temp_menu_path+[me[:sub_menu_code]])
        end
      end
      # 存储权限菜单数据
      def merge_permission_menu(pm)
        if(pm[:permission_code])
          permission = permissions[pm[:permission_code]]
          key = Irm::Permission.url_key(permission[:page_controller],permission[:page_action])
          if permission_menus[key]
            permission_menus[key].push(pm[:path])
          else
            permission_menus.merge!({key=>[pm[:path]]})
          end
        end
      end

      # 存储权限菜单数据
      def merge_menu_menu(mm)
        if(mm[:sub_menu_code])
          if menu_menus[mm[:sub_menu_code]]
            menu_menus[mm[:sub_menu_code]].push(mm[:path])
          else
            menu_menus.merge!({mm[:sub_menu_code]=>[mm[:path]]})
          end
        end
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
          sub_entries<< entries_options.merge!(permission_url_options(pe[:permission_code])) if pe[:display_flag].eql?("Y")
        end
        sub_entries
      end

      # 确定菜单是否可显示
      def menu_showable(menu_entry)
        if(menu_entry[:permission_code])
          return permission_url_options(menu_entry[:permission_code])
        else
          menu = menu_by_code(menu_entry[:sub_menu_code])
          if menu
            menu[:menu_entries].each do |me|
              showable = menu_showable(me)
              return showable if showable
            end

            menu[:permission_entries].each do |pe|
              return permission_url_options(pe[:permission_code])
            end
          end
        end
        false
      end

      # 使用permission_code取得permission中的url 参数
      def permission_url_options(permission_code)
        permission = permissions[permission_code]
        if permission
          {:page_controller=>permission[:page_controller],:page_action=>permission[:page_action]}
        else
          {}
        end
      end

      #通过权限链接取得菜单列表
      def parent_menus_by_permission(options={},top_menu=nil)
        parent_menus =  permission_menus[Irm::Permission.url_key(options[:page_controller]||"irm/permissions",options[:page_action]||"index")]
        parent_menus ||= permission_menus[Irm::Permission.url_key(options[:page_controller]||"irm/permissions","index")]
        return [] if !parent_menus||parent_menus.size<1
        if !top_menu.nil?
          menu_menus[menu_code].each do |pms|
            return pms.dup if pms.first.eql?(top_menu)
          end
        end
        menu_menus[menu_code].first.dup
      end

      # 通过菜单取得上层菜单列表
      def parent_menus_by_menu(menu_code,top_menu=nil)
        parent_menus = menu_menus[menu_code]
        return [] if !parent_menus||parent_menus.size<1
        if !top_menu.nil?
          menu_menus[menu_code].each do |pms|
            return pms.dup if pms.first.eql?(top_menu)
          end
        end
        menu_menus[menu_code].first.dup
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

    end
end