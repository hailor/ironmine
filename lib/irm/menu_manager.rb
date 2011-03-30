module Irm::MenuManager
     class << self

      # 系统中所有菜单，以HASH形式保存
      def menus
        items[:menus]
      end

      def permissions
        items[:permissions]
      end

      def public_functions
        items[:public_functions]
      end


      # 所有权限对应的上级菜单，以HASH形式保存
      def permission_menus
        items[:permission_menus]
      end

      # 所有菜单对应的上级菜单，以HASH形式保存
      def menu_menus
        items[:menu_menus]
      end

      def public_permissions
        items[:public_permissions]
      end

      #初始化菜单和权限缓存
      def reset_menu
        # 生成菜单缓存
        prepare_menu_cache
        # 生成权限缓存
        prepare_permission_cache
        # 初始化权限对应的菜单
        prepare_parent_menu

        #rescue =>text
        #  puts("Init menu error:#{text}")
      end

      # =====================================生成菜单缓存===============================================
      def prepare_menu_cache
        menus = Irm::Menu.enabled
        menus_cache = {}
        menus.each do |m|
          # 子菜单项
          tmp_menu_entries = m.menu_entries.where("sub_menu_code IS NOT NULL AND sub_menu_code!=''").order(:display_sequence)
          menu_entries = []
          tmp_menu_entries.each do |tm|
            action = tm.page_action
            action = "index" if action.nil?||action.blank?
            data = {:menu_entry_id=>tm.id,:sub_menu_code=>tm.sub_menu_code,:page_controller=>tm.page_controller,:page_action=>action,:display_flag=>tm.display_flag,:display_sequence=>tm.display_sequence}
            tm.menu_entries_tls.each do |mt|
              data.merge!({mt.language.to_sym=>{:name=>mt.name,:description=>mt.description}})
            end
            menu_entries<<data
          end
          # 子权限项
          tmp_permission_entries = m.menu_entries.where("(sub_menu_code IS NULL OR sub_menu_code='') AND page_controller IS NOT NULL").order(:display_sequence)
          permission_entries = []
          tmp_permission_entries.each do |tp|
            action = tp.page_action
            action = "index" if action.nil?||action.blank?
            data = {:menu_entry_id=>tp.id,:page_controller=>tp.page_controller,:page_action=>tp.page_action,:display_flag=>tp.display_flag,:display_sequence=>tp.display_sequence}
            tp.menu_entries_tls.each do |mt|
              data.merge!({mt.language.to_sym=>{:name=>mt.name,:description=>mt.description}})
            end
            permission_entries<<data
          end

          menu_data = {:menu_entries=>menu_entries,
                       :permission_entries=>permission_entries,
                       :menu_code=>m.menu_code,
                       :leaf_flag=>m.leaf_flag
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
        public_functions_cache = Irm::Function.where(:public_flag=>"Y").collect{|f| f.function_code}
        permissions_cache = {}
        permissions.each do |p|
          permission_key = Irm::Permission.url_key(p.page_controller,p.page_action)
          if(permissions_cache[permission_key])
            permissions_cache[permission_key]+=[p.function_code]
          else
            permissions_cache[permission_key]=[p.function_code]
          end
        end

        map do |m|
          m.merge!({:permissions=>permissions_cache,:public_functions=>public_functions_cache})
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
        top_menu= Irm::Menu.top_menu.collect{|m| m[:menu_code]}
        top_menu.each do |m|
          expand_permission([m])
        end
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
          merge_permission_menu({:key=>Irm::Permission.url_key(pe[:page_controller],pe[:page_action]),:path=>temp_menu_path})
        end
        current_menu[:menu_entries].each do |me|
          if(menus[me[:sub_menu_code]].nil?)
            Rails.logger.warn("Not exists menu:#{me[:sub_menu_code]} or permission:#{me[:permission_code]},Please check!")
            next
          end
          if(me[:page_controller]&&!me[:page_controller].blank?)
            merge_permission_menu({:key=>Irm::Permission.url_key(me[:page_controller],me[:page_action]),:path=>temp_menu_path+[me[:sub_menu_code]]})
          end
          merge_menu_menu({:sub_menu_code=>me[:sub_menu_code],:path=>temp_menu_path})
          expand_permission(temp_menu_path+[me[:sub_menu_code]])
        end
      end

      # 存储权限菜单数据
      def merge_permission_menu(pm)
        if(pm[:key])
          if permission_menus[pm[:key]]
            permission_menus[pm[:key]].push(pm[:path])
          else
            permission_menus.merge!({pm[:key]=>[pm[:path]]})
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


      #=================================取得当前用户可以访问的菜单和权限==============================================
      # 供外部调用
      # 通过菜单编码取得子菜单项
      # 在返回子项前进行菜单子项的权限验证
      # must_permission_code 表示entry的permission_code不能为空，如果为空使用IRM_SETTING_COMMON填充
      def sub_entries_by_menu(menu_code,must_permission_code=false)
        sub_entries = []
        menu = menus[menu_code]
        return sub_entries unless menu
        menu[:menu_entries].each do |me|
          if(menus[me[:sub_menu_code]].nil?)
            Rails.logger.warn("Not exists menu:#{me[:sub_menu_code]} ,Please check!")
            next
          end
          sub_menu = menus[me[:sub_menu_code]]
          entries_options = {:menu_entry_id=>me[:menu_entry_id],
                             :menu_code => me[:sub_menu_code],
                             :entry_type=>"MENU",
                             :leaf_flag=>sub_menu[:leaf_flag],
                             :display_sequence => me[:display_sequence],
                             :name=>me[::I18n.locale.to_sym][:name],
                             :description=>me[::I18n.locale.to_sym][:description]
                            }
            # 确定当前子菜单项是否可显示
            show_options = menu_showable(me)
          
            # 如果满足下面三个条件，则使用setting common 来代替
            # 1，菜单子项下有可显示的权限
            # 2，菜单为设置类菜单
            # 3，菜单的权限编码为空
            if(show_options&&must_permission_code&&entries_options[:page_controller].nil?&&entries_options[:leaf_flag].eql?(Irm::Constant::SYS_NO))
              show_options = {:page_controller=>"irm/setting",:page_action=>"common"}
            end
            sub_entries<< entries_options.merge!(show_options) if show_options&&me[:display_flag].eql?("Y")
        end
        menu[:permission_entries].each do |pe|
          entries_options = {:menu_entry_id=>pe[:menu_entry_id],
                             :entry_type=>"PERMISSION",
                             :display_sequence => pe[:display_sequence],
                             :name=>pe[::I18n.locale.to_sym][:name],
                             :description=>pe[::I18n.locale.to_sym][:description],
                             :page_controller=>pe[:page_controller],
                             :page_action=>pe[:page_action]
                            }
          sub_entries<< entries_options if pe[:display_flag].eql?("Y")&&Irm::PermissionChecker.allow_to_url?({:page_controller=>pe[:page_controller],:page_action=>pe[:page_action]})
        end
        sub_entries.sort {|x,y| x[:display_sequence] <=> y[:display_sequence] } 
      end

      # 供外部调用
      # 确定菜单是否可显示
      # 只要菜单下有一个可以显示的权限，则表示需要显示该菜单
      def menu_showable(menu_entry)
        if menu_entry[:page_controller]&&menu_entry[:page_action]
          return {:page_controller=>menu_entry[:page_controller],:page_action=>menu_entry[:page_action] } if Irm::PermissionChecker.allow_to_url?({:page_controller=>menu_entry[:page_controller],:page_action=>menu_entry[:page_action] })
        else
          menu = menus[menu_entry[:sub_menu_code]]
          if menu
            
            menu[:menu_entries].each do |me|
              showable = menu_showable(me)
              return showable if showable
            end

            menu[:permission_entries].each do |pe|
              return {:page_controller=>pe[:page_controller],:page_action=>pe[:page_action] } if Irm::PermissionChecker.allow_to_url?({:page_controller=>pe[:page_controller],:page_action=>pe[:page_action] })
            end

          end
        end
        false
      end

      #=================================end 取得当前用户可以访问的菜单和权限==============================================

      #通过权限链接取得菜单列表
      def parent_menus_by_permission(options={},top_menu=nil)
        permission_key = Irm::Permission.url_key(options[:page_controller],options[:page_action])
        parent_menus =  permission_menus[permission_key]
        if(!parent_menus)
          permission_key =   Irm::Permission.url_key(options[:page_controller],"index")
          parent_menus =  permission_menus[permission_key]
        end
        # 如果没有对应的菜单，则返回空数组
        return [] unless parent_menus

        allowed_menus = parent_menus

        if !top_menu.nil?
          allowed_menus.each do |pms|
            return pms.dup if pms.include?(top_menu)
          end
        end
        allowed_menus.first
      end

      # 通过菜单取得上层菜单列表
      def parent_menus_by_menu(menu_code,top_menu=nil)

        parent_menus = menu_menus[menu_code]
        return [] unless parent_menus&&parent_menus.size>0
        allowed_menus = parent_menus||[]

        return [] unless allowed_menus.size>0
        if !top_menu.nil?
          allowed_menus.each do |pms|
            return pms.dup if pms.include?(top_menu)
          end
        end
        allowed_menus.first.dup
      end


      # 判断是否为菜单
      def parent_menu?(parent,child)
        menu_menus[child].detect{|i| i.include?(parent)}
      end



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
      
      private :map,:items
    end
end