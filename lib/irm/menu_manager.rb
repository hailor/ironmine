module Irm::MenuManager
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

      def public_permissions
        items[:public_permissions]
      end

      def login_permissions
        items[:login_permissions]
      end

      #初始化菜单和权限缓存
      def reset_menu
        # 生成菜单缓存
        prepare_menu_cache
        # 生成权限缓存
        prepare_permission_cache
        # 初始化权限对应的菜单
        prepare_parent_menu

        # 初始化登录可访问和公开权限
        prepare_public_login_permission

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
            data = {:menu_entry_id=>tm.id,:sub_menu_code=>tm.sub_menu_code,:permission_code=>tm.permission_code,:display_flag=>tm.display_flag,:display_sequence=>tm.display_sequence}
            tm.menu_entries_tls.each do |mt|
              data.merge!({mt.language.to_sym=>{:name=>mt.name,:description=>mt.description}})
            end
            menu_entries<<data
          end
          # 子权限项
          tmp_permission_entries = m.menu_entries.where("sub_menu_code IS NULL AND permission_code IS NOT NULL").order(:display_sequence)
          permission_entries = []
          tmp_permission_entries.each do |tp|
            data = {:menu_entry_id=>tp.id,:permission_code=>tp.permission_code,:display_flag=>tp.display_flag,:display_sequence=>tp.display_sequence}
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
      # =====================================处理公开和登录即可访问的权限===============================================
      def prepare_public_login_permission
        public_permissions_cache = []
        login_permissions_cache = []

        permission_menus.each do |pkey,menus|
          # 检查是否为开发权限
          origin_length = menus.length
          menus.delete_if{|m| m[0].eql?(Irm::Constant::TOP_PUBLIC_MENU)}
          public_permissions_cache<< pkey if origin_length>menus.length
          # 检查是否为登录可访问权限
          origin_length = menus.length
          menus.delete_if{|m| m[0].eql?(Irm::Constant::TOP_LOGIN_MENU)}
          login_permissions_cache<< pkey if origin_length>menus.length
        end
        map do |m|
          m.merge!({:public_permissions=>public_permissions_cache,:login_permissions=>login_permissions_cache})
        end

        menu_menus.each do |mkey,menus|
          menus.delete_if{|m| m[0].eql?(Irm::Constant::TOP_PUBLIC_MENU)||m[0].eql?(Irm::Constant::TOP_LOGIN_MENU)}          
        end
      end

      # ==============删除菜单路径中的公开和LOGIN权限===========================================
      


      # 供外部调用
      # 通过controller,action取得permission hash
      def permission_by_url(controller,action)
        permission_code = permission_codes[Irm::Permission.url_key(controller,action)]
        permission = nil
        permission = permissions[permission_code].dup if permission_code
        permission
      end

      #=================================取得当前用户可以访问的菜单和权限==============================================
      # 供外部调用
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
          sub_menu = menus[me[:sub_menu_code]]
          entries_options = {:menu_entry_id=>me[:menu_entry_id],
                             :menu_code => me[:sub_menu_code],
                             :entry_type=>"MENU",
                             :leaf_flag=>sub_menu[:leaf_flag],
                             :display_sequence => me[:display_sequence],
                             :name=>me[::I18n.locale.to_sym][:name],
                             :description=>me[::I18n.locale.to_sym][:description],
                             :permission_code=>me[:permission_code]}
            # 确定当前子菜单项是否可显示
            show_options = menu_showable(me)
          
            # 如果满足下面三个条件，则使用setting common 来代替
            # 1，菜单子项下有可显示的权限
            # 2，菜单为设置类菜单
            # 3，菜单的权限编码为空
            if(show_options&&must_permission_code&&entries_options[:permission_code].nil?&&entries_options[:leaf_flag].eql?(Irm::Constant::SYS_NO))
              entries_options.merge!({:permission_code=>"IRM_SETTING_COMMON"})
              show_options = menu_showable(me.merge(:permission_code=>entries_options[:permission_code]),false)
            end
            sub_entries<< entries_options.merge!(show_options) if show_options&&me[:display_flag].eql?("Y")
        end
        menu[:permission_entries].each do |pe|
          if(permissions[pe[:permission_code]].nil?)
            Rails.logger.warn("Not exists  permission:#{pe[:permission_code]},Please check!")
            next
          end
          entries_options = {:menu_entry_id=>pe[:menu_entry_id],
                             :entry_type=>"PERMISSION",
                             :display_sequence => pe[:display_sequence],
                             :name=>pe[::I18n.locale.to_sym][:name],
                             :description=>pe[::I18n.locale.to_sym][:description],
                             :permission_code=>pe[:permission_code]}
          sub_entries<< entries_options.merge!(permission_url_options(pe[:permission_code])) if pe[:display_flag].eql?("Y")&&check_permission(pe[:permission_code],menu[:menu_code],true)
        end
        sub_entries.sort {|x,y| x[:display_sequence] <=> y[:display_sequence] } 
      end

      # 供外部调用
      # 确定菜单是否可显示
      # 只要菜单下有一个可以显示的权限，则表示需要显示该菜单
      def menu_showable(menu_entry,must_top=true)
        if(menu_entry[:permission_code]&&check_permission(menu_entry[:permission_code],menu_entry[:sub_menu_code],must_top))
          return permission_url_options(menu_entry[:permission_code])
        else
          menu = menus[menu_entry[:sub_menu_code]]
          if menu
            
            menu[:permission_entries].each do |pe|
              return permission_url_options(pe[:permission_code]) if check_permission(pe[:permission_code],menu_entry[:sub_menu_code],must_top)
            end

            menu[:menu_entries].each do |me|
              showable = menu_showable(me)
              return showable if showable
            end

          end
        end
        false
      end

      # private
      # 检查permission的权限
      def check_permission(permission_code,top_menu=nil,must_top=false)
        return true if permission_code.nil?||permissions[permission_code].nil?
        permission = permissions[permission_code].dup
        # 参考 permission_checker
        permission = Irm::Permission.to_permission(permission)
        if permission&&permission.page_controller&&permission.enabled?&&Irm::Person.current
          menus = Irm::MenuManager.parent_menus_by_permission({:page_controller=>permission.page_controller,:page_action=>permission.page_action},top_menu,must_top)
          menus.size>0
        else
          true
        end
      end


      # 使用permission_code取得permission中的url 参数
      def permission_url_options(permission_code)
        permission = permissions[permission_code]
        if permission
          {:page_controller=>permission[:page_controller],:page_action=>permission[:page_action]}
        else
          Rails.logger.warn("Not exists  permission:#{permission_code},Please check!")
          {}
        end
      end
      #=================================end 取得当前用户可以访问的菜单和权限==============================================

      #通过权限链接取得菜单列表
      def parent_menus_by_permission(options={},top_menu=nil,must_top=false)
        allowed_menu_codes = Irm::Person.current.allowed_menus
        permission_key = Irm::Permission.url_key(options[:page_controller],options[:page_action])
        parent_menus =  permission_menus[permission_key]
        if(!parent_menus)
          permission_key =   Irm::Permission.url_key(options[:page_controller],"index")
          parent_menus =  permission_menus[permission_key]
        end
        # 如果没有对应的菜单，则返回空数组
        return [] unless parent_menus
        # 如果parent_menus为空数组，表示该权限属于PUBLIC 或 LOGIN
        return ["LOGIN_OR_PUBLIC_MENU"] unless parent_menus.size>0

        allowed_menus = []

        # 如果为登录可访问和公开权限，则不需要进行过滤
        if(login_permissions.include?(permission_key)||public_permissions.include?(permission_key))
          allowed_menus =  parent_menus.dup
        else
          accesses = []
          parent_menus.each do |pms|
            allowed_menu_codes.each do |amc|
              idx = pms.index(amc[:menu_code])
              accesses << [idx,amc[:access],pms] if idx
            end
          end
          # 进行权限优先级判断
          accesses.dup.each do |a|
            accesses.delete_if{|item| item[0]<a[0]&&item[2].eql?(a[2])}
          end
          # 删除限制访问的菜单
          accesses.delete_if{|item| item[1].eql?(Irm::Constant::ACCESS_NONE)}
          # 如果为编辑类型的权限
          # 删除查看类型的菜单路径
          if(Irm::Constant::EDIT_ACTION.detect{|a| options[:page_action].include?(a)})          
            accesses.delete_if{|item| item[1].eql?(Irm::Constant::ACCESS_VIEW)}
          end
          allowed_menus = accesses.collect{|item| item[2]} if accesses.size>0
        end

        return [] unless allowed_menus.size>0
       
        if !top_menu.nil?
          allowed_menus.each do |pms|
            return pms.dup if pms.include?(top_menu)
          end
        end
        return [] if must_top
        allowed_menus.first.dup
      end

      # 通过菜单取得上层菜单列表
      def parent_menus_by_menu(menu_code,top_menu=nil)

        #allowed_menu_codes= Irm::Person.current.allowed_menus.collect{|m| m[:menu_code]}
        # 取得父菜单
        parent_menus = menu_menus[menu_code]
        return [] unless parent_menus&&parent_menus.size>0
        allowed_menus = parent_menus||[]
        # 如果menu_code是当前允许访问菜单的父菜，则不进行过滤
        #if(allowed_menu_codes.include?(menu_code)||allowed_menu_codes.detect{|amc| parent_menu?(menu_code,amc)})
        #  allowed_menus = parent_menus
        #else
        #  parent_menus.each do |pms|
        #    pms.each do |mc|
        #      if allowed_menu_codes.include?(mc)
        #        allowed_menus << pms
        #        break
        #      end
        #    end
        #  end
        #end
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