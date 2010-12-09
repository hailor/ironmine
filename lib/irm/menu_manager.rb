# 用来管理系统的菜单
module Irm
  module MenuManager
    class << self

      # 所有菜单
      def menus
        items[:menus]
      end
      # 所有权限
      def permissions
        items[:permissions]
      end

      # 所有权限编码
      def permission_codes
        items[:permission_codes]
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
            data = {:sub_menu_code=>tm.sub_menu_code,:permission_code=>tm.permission_code}
            tm.menu_entries_tls.each do |mt|
              data.merge!({mt.language.to_sym=>{:name=>mt.name,:description=>mt.description}})
            end
            menu_entries<<data
          end
          # 子权限项
          tmp_permission_entries = m.menu_entries.where("sub_menu_code IS NULL AND permission_code IS NOT NULL")
          permission_entries = []
          tmp_permission_entries.each do |tp|
            data = {:permission_code=>tp.permission_code}
            tp.menu_entries_tls.each do |mt|
              data.merge!({mt.language.to_sym=>{:name=>mt.name,:description=>mt.description}})
            end
            menu_entries<<data
          end

          menu_data = {:menu_entries=>menu_entries,
                       :permission_entries=>permission_entries,
                       :menu_code=>m.menu_code
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

        rescue =>text
          puts("Init menu error:#{text}")
      end


      #通过controller,action取得permission hash
      def permission_by_url(controller,action)
        permission_code = permission_codes[Irm::Permission.url_key(controller,action)]
        permission = nil
        permission = items[:permissions][permission_code].delete(:options) if permission_code
        permission
      end

      def menu_by_code(menu_code)
        menus[menu_code]
      end

      # 通过菜单编码取得子菜单项
      # 在返回子项前进行菜单子项的权限验证
      def sub_entries_by_menu(menu_code)
        sub_entries = []
        menu = menus[menu_code]
        menu[:menu_entries].each do |me|
          entries_options = {:menu_code => me[:sub_menu_code],
                             :entry_type=>"MENU",
                             :name=>me[::I18n.locale.to_sym][:name],
                             :description=>me[::I18n.locale.to_sym][:description],
                             :permission_code=>me[:permission_code]}
          sub_entries<< entries_options if menu_showable(me)
        end
        menu[:menu_entries].each do |pe|
          entries_options = {:entry_type=>"PERMISSION",
                             :name=>pe[::I18n.locale.to_sym][:name],
                             :description=>pe[::I18n.locale.to_sym][:description],
                             :permission_code=>pe[:permission_code]}
          sub_entries<< entries_options if check_permission(pe[:permission_code])
        end
      end

      # 确定菜单是否可显示
      def menu_showable(menu_entry)
        if(menu_entry[:permission_code])
          check_permission(menu_entry[:permission_code])
        else
          menu = menu_by_code(menu_entry[:sub_menu_code])
          if menu
            menu[:menu_entries].detect{|me| menu_showable(me)}||menu[:permission_entries].detect{|pe| check_permission(pe[:permission_code])}
          else
            true
          end
        end
      end

      # 检查permission的权限
      def check_permission(permission_code)
        permission = items[:permissions][permission_code].delete(:options)
        Irm::PermissionChecker.allow_to?(permission)
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

    end
  end
end