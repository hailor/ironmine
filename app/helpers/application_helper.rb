module ApplicationHelper
  def page_title(title = "", description = "")
    page_title = ""
    page_description = ""
    b_description = ""
    if @current_menu_entry && @current_menu_entry.permission_code
      permission = Irm::Permission.list_all.where(:id => @current_permission.id).first
      if @current_menu_entry.icon
        page_description << content_tag(:img, "", :src => '/images/s.gif', :class => @current_menu_entry.icon + " pageTitleIcon")
      end
      if !title.blank?
        page_title << content_tag(:h1, title, :class => "pageType")
      else
        page_title << content_tag(:h1, @current_menu_entry[:name], :class => "pageType")
      end
      if !description.blank?
        page_description << content_tag(:h2, description, :class => "pageDescription")
      else
        page_description << content_tag(:h2, permission[:name], :class => "pageDescription")
      end
      if !permission[:description].blank?
        b_description << content_tag(:div, permission[:description], :class => "bDescription")  
      end
    else
      page_title << content_tag(:h1, title, :class => "pageType")
      page_description << content_tag(:h2, description, :class => "pageDescription")
    end
    content = raw(content_tag(:div, raw(page_title + page_description), :class => "content"))
    pt_body = raw(content_tag(:div, content, :class => "ptBody"))
    b_page_title = raw(content_tag(:div, pt_body, :class => "bPageTitle"))
    raw(b_page_title)
  end

  def setting_title(params = {:title => "", :description => ""})
    page_title = ""
    page_description = ""
    b_description = ""
    if @current_menu_entry && @current_menu_entry.permission_code
      permission = Irm::Permission.list_all.where(:id => @current_permission.id).first
      t_title = ""
      if params[:title] && !params[:title].blank?
        t_title << params[:title] + ": "
      else
        t_title << @current_menu_entry[:name] + ": "
      end
      if params[:description] && !params[:description].blank?
        t_title << params[:description]
      else
        t_title << permission[:name]
      end
      page_description << content_tag(:h2, t_title, :class => "pageDescription")
      if !permission[:description].blank?
        b_description << content_tag(:div, permission[:description], :class => "bDescription")
      end
    else
      page_title << content_tag(:h1, params[:title], :class => "pageType")
      page_description << content_tag(:h2, params[:description], :class => "pageDescription")
    end
    content = raw(content_tag(:div, raw(page_title + page_description), :class => "content"))
    pt_body = raw(content_tag(:div, content, :class => "ptBody"))
    b_page_title = raw(content_tag(:div, pt_body, :class => "bPageTitle"))
    raw(b_page_title)
  end

  def app_title(params = {:title => "", :description => ""})
    page_title = ""
    page_description = ""
    b_description = ""
    if @current_menu_entry && @current_menu_entry.permission_code
      permission = Irm::Permission.list_all.where(:id => @current_permission.id).first
      if @current_menu_entry.icon
        page_description << content_tag(:img, "", :src => '/images/s.gif', :class => @current_menu_entry.icon + " pageTitleIcon")
      end
      t_title = ""
      if params[:title] && !params[:title].blank?
        t_title << params[:title] + ": "
      else
        t_title << @current_menu_entry[:name] + ": "
      end
      if params[:description] && !params[:description].blank?
        t_title << params[:description]
      else
        t_title << permission[:name]
      end
      page_description << content_tag(:h2, t_title, :class => "pageDescription")
      if !permission[:description].blank?
        b_description << content_tag(:div, permission[:description], :class => "bDescription")
      end
    else
      page_title << content_tag(:h1, params[:title], :class => "pageType")
      page_description << content_tag(:h2, params[:description], :class => "pageDescription")
    end
    content = raw(content_tag(:div, raw(page_title + page_description), :class => "content"))
    pt_body = raw(content_tag(:div, content, :class => "ptBody"))
    b_page_title = raw(content_tag(:div, pt_body, :class => "bPageTitle"))
    raw(b_page_title)
  end  

  def setting_show_title(params = {})
    page_title = ""
    page_description = ""
    b_description = ""
    if @current_menu_entry && @current_menu_entry.permission_code
      permission = Irm::Permission.list_all.where(:id => @current_permission.id).first
      if @current_menu_entry.icon
        page_description << content_tag(:img, "", :src => '/images/s.gif', :class => @current_menu_entry.icon + " pageTitleIcon")
      end      
      if params[:title] && !params[:title].blank?
        page_title << content_tag(:h1, params[:title], :class => "pageType")
      else
        page_title << content_tag(:h1, @current_menu_entry[:name], :class => "pageType")
      end
      if params[:show_data] && !params[:show_data].blank?
        page_description << content_tag(:h2, params[:show_data], :class => "pageDescription")
      end
      if !permission[:description].blank?
        b_description << content_tag(:div, permission[:description], :class => "bDescription")
      end
    else
      page_title << content_tag(:h1, params[:title], :class => "pageType")
      page_description << content_tag(:h2, params[:description], :class => "pageDescription")
    end
    content = raw(content_tag(:div, raw(page_title + page_description), :class => "content"))
    pt_body = raw(content_tag(:div, content, :class => "ptBody"))
    b_page_title = raw(content_tag(:div, pt_body, :class => "bPageTitle"))
    raw(b_page_title)
  end

  def app_show_title(params = {})
    page_title = ""
    page_description = ""
    b_description = ""
    if @current_menu_entry && @current_menu_entry.permission_code
      permission = Irm::Permission.list_all.where(:id => @current_permission.id).first
      if params[:title] && !params[:title].blank?
        page_title << content_tag(:h1, params[:title], :class => "pageType")
      else
        page_title << content_tag(:h1, @current_menu_entry[:name], :class => "pageType")
      end
      if params[:show_data] && !params[:show_data].blank?
        page_description << content_tag(:h2, params[:show_data], :class => "pageDescription")
      end
      if !permission[:description].blank?
        b_description << content_tag(:div, permission[:description], :class => "bDescription")
      end
    else
      page_title << content_tag(:h1, params[:title], :class => "pageType")
      page_description << content_tag(:h2, params[:description], :class => "pageDescription")
    end
    content = raw(content_tag(:div, raw(page_title + page_description), :class => "content"))
    pt_body = raw(content_tag(:div, content, :class => "ptBody"))
    b_page_title = raw(content_tag(:div, pt_body, :class => "bPageTitle"))
    raw(b_page_title)
  end  
  
  #显示form提交的出错信息
  def error_message_for(*args)
    lis=""
    error_count = 0
    full_messages = []
    args.each do |instance|
       if instance.errors&&instance.errors.any?
          instance.errors.each do | attr,msg|
            full_messages<<t(("label_#{instance.class.name.underscore.gsub(/\//, "_")}_" + attr.to_s.gsub(/\_id$/, "")).to_sym)+" #{msg}"
          end
          error_count+=instance.errors.count
       end
    end
    full_messages.each do |msg|
     lis<<content_tag(:li,msg,nil,false)
    end
    uls=content_tag(:ul,lis,nil,false)
    h2s=content_tag(:h2,"Errors",nil,false)
    if error_count>0
      content_tag(:div,content_tag(:div, raw("#{h2s}\n#{uls}"), {:class=>"errormsgbox"}) ,{:id=>"system_message_box"},false)
    else
      nil
    end
  end

  def succ_message_for(msg)
    content_tag(:div,content_tag(:div, raw(msg), {:class=>"succmsgbox"}) ,{:id=>"system_message_box"},false)
  end

  # 确认当前用户是否有权限访问链接
  # 页面上的链接数量太多，采用缓存将页面permission信息存储
  def allow_to?(url_options={})
    Irm::PermissionChecker.allow_to_url?(url_options)
  end

  # 生成YUI表格
  def datatable(id,source_url,columns,options={})
    row_perpage = options[:row_perpage]||20
    search_box = options[:search_box]
    select = options[:select]
    columns.insert(0,{:key=>"dt_selector",:width=>"36px"}) if select&&(select.eql?("multiple")||select.eql?("single"))
    columns_conf = ""
    data_fields = ""
    columns.each do |c|
      data_fields << %Q("#{c[:field]||c[:key]}",)
      next if c[:hidden]
      column = "{"
      c.each do |key,value|
        if(!key.to_s.eql?("formatter"))
          column << %Q(#{key.to_s}:"#{value}",)
        else
          column << %Q(#{key.to_s}:#{value},)
        end
      end
      columns_conf << column.chop
      columns_conf << "},"
    end
    columns_conf.chop!
    data_fields.chop!


    load_str = "#{id}Datatable.datasource.load()"
    load_str = "//does not load at init" if options[:not_load]

    search_str = ""
    search_str = ".plug(Y.Plugin.IrmDTSearchBox,{searchDom:'#{search_box}'})" if search_box

    select_str = ""
    select_str = ".plug(Y.Plugin.IrmDTSelector,{mode:'multiple'})" if select&&select.eql?("multiple")
    select_str = ".plug(Y.Plugin.IrmDTSelector,{mode:'single'})" if select&&select.eql?("single")

    script = %Q(GY.use("irm","datasource-get", "datasource-jsonschema","dtdatasource","dtsort","dtsearchbox","dtselector","dtcolwidth",function(Y) {
       Y.on("domready",function(){
         var #{id}Cols = [#{columns_conf}],
         #{id}Datasource = new Y.DataSource.Get({source:'#{source_url}'})
                   .plug(Y.Plugin.DataSourceJSONSchema, {
                      schema: {
                        resultListLocator: "items",
                        resultFields: [#{data_fields}]
             }
         }),
         #{id}Datatable = new Y.DataTable.Base({columnset:#{id}Cols})
             .plug(Y.Plugin.IrmDTDataSource, {datasource:#{id}Datasource})#{select_str}.plug(Y.Plugin.IrmDTSort)#{search_str}.plug(Y.Plugin.IrmDTColWidth).render("##{id}");
         #{id}Datatable.datasource.paginate({start:0,count:#{row_perpage}});
         #{load_str}
         Y.irm.setAttribute('#{id}Datatable',#{id}Datatable,'Datatable');
        });
     });)
    javascript_tag(script)
  end

  def tabview(id, srcs = {})
    script = %Q(
      GY.use("tabview", "gallerywidgetio", "async-queue", function(Y) {
          TabIO = function(config) {
              TabIO.superclass.constructor.apply(this, arguments);
          };

          Y.extend(TabIO, Y.Plugin.WidgetIO, {
              initializer: function() {
                  var tab = this.get('host');
                  tab.on('selectedChange', this.afterSelectedChange);
                  tab.on('contentUpdate', this.contentUpdate);
                  tab.get('panelNode').on('contentUpdate', this.contentUpdate);
              },
              contentUpdate:function(e){
                  alert("test");
              },
              afterSelectedChange: function(e) { // this === tab
                  if (e.newVal) { // tab has been selected
                      this.io.refresh();
                  }
              },
              setContent: function(content) {
                  var tab = this.get('host');
                  tab.set('content', content);
              },
              _toggleLoadingClass: function(add) {
                  this.get('host').get('panelNode')
                      .toggleClass(this.get('host').getClassName('loading'), add);
              }
          }, {
              NAME: 'tabIO',
              NS: 'io'
          });

          var feeds = #{srcs.to_json};
          var tabview = new Y.TabView();
          Y.each(feeds, function(src, label) {
              tabview.add({
                  label: label,
                  plugins: [{
                      fn: TabIO,
                      cfg: {
                          uri: src
                      }
                  }]
              });
          });
          tabview.render('##{id}');
      });
    )
    javascript_tag(script);
  end

  def error_for(object)
    if object && object.errors && object.errors.any?
      content_tag("div", raw(t(:error_invalid_data) + "<br>" + t(:check_error_msg_and_fix)), {:id => "errorDiv_ep", :class => "pbError"})
    end
  end


  #重写content_for方法,当调用content_for时,修改has_content
  def content_for(name, content = nil, &block)
    @has_content ||= {}
    @has_content[name] = true
    super(name, content, &block)
  end

  #利用@has_content来判断是否存在name content
  def has_content?(name)
    (@has_content && @has_content[name]) || false
  end
  
  def link_back(text = t(:back))
    link_to text, {}, {:href => "javascript:history.back();"}
  end

  #构建日历控件，其中text_field是输入的日期框，id_button是点击日历的
  #button，而id_cal是日历显示的ID，最好不一致
  def calendar_view(id_text_field,id_button,id_cal)
    script = %Q(
       GY.use( 'yui2-calendar','yui2-container',function(Y) {
            var YAHOO = Y.YUI2;
            var Event = YAHOO.util.Event,Dom = YAHOO.util.Dom;
             YAHOO.util.Event.onDOMReady(function () {
                show_irm_calendar(YAHOO,Event,Dom,"#{id_button}","#{id_text_field}","#{id_cal}");
             });
       });
    )
    javascript_tag(script)
  end

  def format_date(time)
    time.strftime('%Y-%m-%d %H:%M:%S')
  end

  def show_check_box(value = "", y_value = "")
    tags = ""
    if !y_value.blank?
      value = Irm::Constant::SYS_YES if value == y_value
    end
    if value == Irm::Constant::SYS_YES
      tags << content_tag(:img, "",
                          {:class => "checkImg", :width => "21", :height => "16",
                           :title => I18n.t(:label_checked), :alt => I18n.t(:label_checked),
                           :src => theme_image_path("checkbox_checked.png") })
    else
      tags << content_tag(:img, "",
                          {:class => "checkImg", :width => "21", :height => "16",
                           :title => I18n.t(:label_unchecked), :alt => I18n.t(:label_unchecked),
                           :src => theme_image_path("checkbox_unchecked.png") })
    end
    raw(tags)
  end

  def check_img(value = "")
     content_tag(:img, "",{:class => "checkImg", :width => "21", :height => "14",
                           :src => theme_image_path("#{value}.png") }) if !value.blank?
  end

  def show_date(options={})
     advance = options[:months_advance]||0
     (Time.now.advance(:months => advance)).strftime("%Y-%m-%d").to_s
  end

  #简单讲hash和数组中的数据转换成图表所需要的数据
   def to_chart_json(chart_data)
      json = %Q([)
      if chart_data.is_a?(Hash)
        chart_data.each do |key,value|
          json << %Q({category:"#{key}",value:#{value}},)
        end
        json.chomp!(",")
      elsif chart_data.is_a?(Array)
        chart_data.each do |elem|
          json << %Q({category:"#{elem[0]}",value:#{elem[1]}},)
        end
        json.chomp!(",")
      end
      json << "]"
      json
   end

  def link_to_checker(body, url_options = {}, html_options = {})
    if Irm::PermissionChecker.allow_to_url?(url_options)
      return link_to(body, url_options, html_options)
    end
    ""
  end

  def current_company_access_menu
    accesses = Irm::CompanyAccess.query_by_person_id(Irm::Person.current.id).collect{|c| c.accessable_company_id}
    accessable_companies = Irm::Company.multilingual.query_by_ids(accesses)
    return nil unless accessable_companies&&accessable_companies.size>0
    session[:accessable_companies] ||=  accesses
    links = ""
    accessable_companies.each_with_index do |ac,index|
      content = check_box_tag("accessable_companies[]",ac.id,session[:accessable_companies].include?(ac.id),{:id=>"accessable_companies_#{ac.id}"}) + label_tag("accessable_companies_#{ac.id}",ac[:name])
      links << content_tag(:div,content,{:class=>"menuItem"})
    end

    links.html_safe
  end

end
