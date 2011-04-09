module Irm::MyInfoHelper
  def current_company_access_menu
    accesses = Irm::CompanyAccess.query_by_person_id(Irm::Person.current.id).collect{|c| c.accessable_company_id}
    # no company or only global company
    if accesses.size<1||(accesses.size==1&&accesses[0]==1)
      return nil
    end
    accessable_companies = Irm::Company.multilingual.query_by_ids(accesses)

    menu = ""
    menu_script = <<-BEGIN_SCRIPT
    <script type="text/javascript">
      GY.use("irm","node-base",function(Y){
        Y.on("domready",function(){
          Y.irm.menuButton("companyMenu","TR","BR");
        });
        Y.one("#selectComapnyContent").delegate('click', function(e){
           var checkbox = e.currentTarget;
           Y.one("#selectableCompany").all("input[type=checkbox]").set("checked",checkbox.get("checked"));
        }, '#selectAll');
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
         <div class="menuContent" >
    BEGIN_HEML

    #如果公司数目大于5个则显示搜索
    menu <<  form_tag({:controller=>"irm/my_info",:action=>"filter_company",:format=>"js"},{:remote=>true})  do
       %(<div class="menuItem"><input name="query" type="text" size="10" />#{submit_tag t(:search)}</div>).html_safe
    end if accessable_companies.size>4

    menu << form_tag({:controller=>"irm/my_info",:action=>"update_company_access",:return_controller=>params[:controller]},{:method=>:put})
    menu << %(<div id="selectComapnyContent">)
    menu << access_company_checkbox(accessable_companies)
    menu << %(</div>)
    menu << submit_tag(t(:apply))
    menu << "</form>"
    menu << %(</div>)
    menu << "</span>"

    menu.html_safe
  end


  def access_company_checkbox(accessable_companies)
    links = ""
    # 如果可选公司数目只一个，则不显全选
    if accessable_companies.size>1
      tmp_cids = accessable_companies.collect{|ac| ac.id}
      tmp_cids.delete_if{|ci| session[:accessable_companies].include?(ci)}
      select_all_content = check_box_tag("select_all","all",tmp_cids.size==0,{:id=>"selectAll"}) + label_tag("selectAll",t(:select_all))
      links << content_tag(:div,select_all_content,{:class=>"menuItem"})
    end
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

end