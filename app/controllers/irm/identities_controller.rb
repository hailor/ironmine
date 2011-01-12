class Irm::IdentitiesController < ApplicationController
  def index
    @identity = Irm::Identity.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @identity }
    end
  end

  def show
    @identity = Irm::Identity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @identity }
    end
  end

  def new
    @identity = Irm::Identity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @identity }
    end
  end

  def edit
    @identity = Irm::Identity.find(params[:id])
  end

  def create
    @identity = Irm::Identity.new(params[:irm_identity])

    respond_to do |format|
      if @identity.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @identity, :status => :created, :location => @identity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @identity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @identity = Irm::Identity.find(params[:id])

    respond_to do |format|
      if @identity.update_attributes(params[:irm_identity])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @identity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @identity = Irm::Identity.find(params[:id])
    @identity.destroy

    respond_to do |format|
      format.html { redirect_to(permissions_url) }
      format.xml  { head :ok }
    end
  end

  def get_data
    identities_scope = Irm::Identity.query_all.with_language
    identities,count = paginate(identities_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(identities.to_grid_json([:login_name,:full_name,:email,:language_description,:status_code], count)) }
    end    
  end
  #个人信息显示页面
  def my_info
    @identity = Irm::Identity.query_all.query(Irm::Identity.current.id).with_language.first
  end

  #个人信息编辑页面
  def edit_info
    @identity = Irm::Identity.query_all.query(Irm::Identity.current.id).with_language.first
  end
  # 更新个人信息
  def update_info
    @identity = Irm::Identity.query_all.query(Irm::Identity.current.id).with_language.first

    respond_to do |format|
      if @identity.update_attributes(params[:irm_identity])
        format.html { redirect_to({:action=>"my_info",:format=>:js}, :notice =>t(:successfully_updated)) }
      else
        format.html { render "edit_info" }
      end
    end

  end
  # 个人密码修改页面
  def edit_password
    @identity = Irm::Identity.current
  end
  # 更新个人密码
  def update_password
    @identity = Irm::Identity.current
    params[:irm_identity][:password]="*" if params[:irm_identity][:password].blank?
    respond_to do |format|
      if(params[:irm_identity][:old_password]&&check_password(params[:irm_identity][:old_password]))
        if @identity.update_attributes(params[:irm_identity])
          format.html {redirect_to({:action=>"edit_password"},:notice=>t(:successfully_updated))}
        else
          @identity.password = "" if @identity.password.eql?("*")
          format.html {render("edit_password")}
        end
      else
        @identity.errors.add(:old_password,t('activerecord.errors.messages.invalid'))
        format.html { render("edit_password")}
      end
    end
  end

  def show
     @identity = Irm::Identity.find(params[:id])
  end
  private

  def check_password(password)
    Irm::Identity.current.hashed_password.eql?(Irm::Identity.hash_password(password))
  end
end
