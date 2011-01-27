class Irm::MyInfoController < ApplicationController
  #个人信息显示页面
  def index
    @identity = Irm::Identity.query_all.query(Irm::Identity.current.id).with_language.first
  end

  #个人信息编辑页面
  def edit
    @identity = Irm::Identity.query_all.query(Irm::Identity.current.id).with_language.first
  end
  # 更新个人信息
  def update
    @identity = Irm::Identity.query_all.query(Irm::Identity.current.id).with_language.first

    respond_to do |format|
      if @identity.update_attributes(params[:irm_identity])
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_updated)) }
      else
        format.html { render "edit" }
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
          format.html {redirect_to({:action=>"index"},:notice=>t(:successfully_updated))}
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

  private

  def check_password(password)
    Irm::Identity.current.hashed_password.eql?(Irm::Identity.hash_password(password))
  end
end
