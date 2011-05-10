module Irm::MyInfoHelper
  def current_company_access_menu
    accesses = Irm::CompanyAccess.query_by_person_id(Irm::Person.current.id).collect{|c| c.accessable_company_id}
    # no company or only global company
    if accesses.size<2
      return nil
    end
    accessable_companies = Irm::Company.multilingual.query_by_ids(accesses)

    menu = ""
    menu_script = <<-BEGIN_SCRIPT
    <script type="text/javascript">
      GY.use("menubutton","node-base",function(Y){
        Y.on("domready",function(){
          new Y.MenuButton({menuNode:"#companyMenu",dropAlign:["TR","BR"]});
        });
        Y.one("#selectAll").on('click', function(e){
           var checkbox = e.currentTarget;
           Y.one("#selectableCompany").all("input[type=checkbox]").set("checked",checkbox.get("checked"));
        });
      });
    </script>
    BEGIN_SCRIPT
    menu << menu_script
    menu << <<-BEGIN_HEML
      <span id="companyMenu" class="menuParent" style="float:right">
         <div  class="menuLabel">
           <span tabindex="0" id="companyMenuTop" style="">#{t(:label_company_access_menu_label)}</span>
           <div id="companyMenu-arrow"></div>
         </div>
         <div class="menuContent" style="padding-bottom:12px;">
    BEGIN_HEML

    #如果公司数目大于5个则显示搜索
    menu <<  form_tag({:controller=>"irm/my_info",:action=>"filter_company",:format=>"js"},{:remote=>true})  do
       %(<div class="menuItem"><input name="query" type="text" size="10" />#{submit_tag t(:search)}</div>).html_safe
    end if accessable_companies.size>4

    menu << form_tag({:controller=>"irm/my_info",:action=>"update_company_access",:return_controller=>params[:controller]},{:method=>:put})
    menu << %(<div id="selectComapnyContent">)
    menu << access_company_checkbox(accessable_companies)
    menu << %(</div>)

    if accessable_companies.size>1
      tmp_cids = accessable_companies.collect{|ac| ac.id}
      tmp_cids.delete_if{|ci| session[:accessable_companies].include?(ci)}
      select_all_content = check_box_tag("select_all","all",tmp_cids.size==0,{:id=>"selectAll"}) + label_tag("selectAll",t(:select_all))
      menu << content_tag(:div,select_all_content,{:class=>"menuItem", :style => "float:left;"})
    end
    menu << submit_tag(t(:apply), :style => "float:right;")
    menu << "&nbsp;"
    menu << "</form>"
    menu << %(</div>)
    menu << "</span>"

    menu.html_safe
  end


  def access_company_checkbox(accessable_companies)
    links = ""
    # 如果可选公司数目只一个，则不显全选
#    if accessable_companies.size>1
#      tmp_cids = accessable_companies.collect{|ac| ac.id}
#      tmp_cids.delete_if{|ci| session[:accessable_companies].include?(ci)}
#      select_all_content = check_box_tag("select_all","all",tmp_cids.size==0,{:id=>"selectAll"}) + label_tag("selectAll",t(:select_all))
#      links << content_tag(:div,select_all_content,{:class=>"menuItem"})
#    end
    links << %(<div id="selectableCompany">)
    accessable_companies.each_with_index do |ac,index|
      content = check_box_tag("accessable_companies[]",ac.id,session[:accessable_companies].include?(ac.id),{:id=>"accessable_companies_#{ac.id}"}) + label_tag("accessable_companies_#{ac.id}",ac[:name])
      links << content_tag(:div,content,{:class=>"menuItem"})
    end
    links << %(</div>)
    links.html_safe
  end

  def show_filtered_company(query)
    query = query.strip
    accesses = Irm::CompanyAccess.query_by_person_id(Irm::Person.current.id).collect{|c| c.accessable_company_id}
    # no company or only global company
    if accesses.size<1||(accesses.size==1&&accesses[0]==1)
      return nil
    end
    accessable_companies = Irm::Company.multilingual.query_by_ids(accesses)
    accessable_companies.delete_if{|c| !c[:name].include?(query)} unless query.nil?&&query.blank?
    access_company_checkbox(accessable_companies)
  end

  # generate role menu
  def current_role_menu
    return nil unless Irm::Person.current&&Irm::Role.current
    roles = Irm::Role.multilingual.not_hidden.query_by_person(Irm::Person.current.id)
    return nil unless roles.size>1
    role = ""
    role_script = <<-BEGIN_SCRIPT
    <script type="text/javascript">
      GY.use("menubutton",function(Y){
        Y.on("domready",function(){
          new Y.MenuButton({menuNode:"#pageMenu",dropAlign:["TR","BR"]});
        });
      });
    </script>
    BEGIN_SCRIPT
    role << role_script
    role << <<-BEGIN_HEML
      <span id="pageMenu" class="menuParent" style="float:right;">
        <div  class="menuLabel">
          <span tabindex="0" id="pageMenuTop" style="">#{current_role_name}</span>
          <div id="pageMenu-arrow"></div>
        </div>
        <div class="menuContent" >
          #{list_roles(roles)}
        </div>
      </span>
    BEGIN_HEML

    role.html_safe

  end

  def current_role_name
    Irm::Role.multilingual.find(Irm::Role.current.id)[:name]
  end

  # 生成一级菜单
  def list_roles(roles)
    links = ""
    roles.each do |r|
      next if Irm::Role.current&&r.id.eql?(Irm::Role.current.id)
      links << content_tag(:span,link_to(r[:name],{:controller=>"irm/navigations",:action=>"change_role",:role_id=>r.id,:top_menu=>r.menu_code}),{:class=>"menuItem"})
    end

    links.html_safe
  end

end