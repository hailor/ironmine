# -*- coding: utf-8 -*-
class AddLoingPublicFunction < ActiveRecord::Migration
  def self.up
    irm_irm_public= Irm::FunctionGroup.new(:group_code=>'IRM_PUBLIC',:not_auto_mult=>true)
    irm_irm_public.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公开功能',:description=>'公开功能')
    irm_irm_public.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Public Functions',:description=>'Public Functions')
    irm_irm_public.save
    irm_irm_login= Irm::FunctionGroup.new(:group_code=>'IRM_LOGIN',:not_auto_mult=>true)
    irm_irm_login.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'登录可访问功能',:description=>'登录可访问功能')
    irm_irm_login.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Login Accessable Functions',:description=>'Login Accessable Functions')
    irm_irm_login.save

    irm_public_function= Irm::Function.new(:group_code=>'IRM_PUBLIC',:function_code=>'PUBLIC_FUNCTION',:default_flag=>'N',:public_flag=>'Y',:login_flag=>"N",:not_auto_mult=>true)
    irm_public_function.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公开功能',:description=>'公开功能')
    irm_public_function.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Public Function',:description=>'Public Function')
    irm_public_function.save
    irm_login_function= Irm::Function.new(:group_code=>'IRM_LOGIN',:function_code=>'LOGIN_FUNCTION',:default_flag=>'N',:public_flag=>'N',:login_flag=>"Y",:not_auto_mult=>true)
    irm_login_function.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'登录可访问功能',:description=>'登录可访问功能')
    irm_login_function.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Login Accessage Function',:description=>'Login Accessage Function')
    irm_login_function.save
  end

  def self.down
  end
end
