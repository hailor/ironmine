# -*- coding: utf-8 -*-
class AddDepartmentsPermissions < ActiveRecord::Migration
  def self.up
    irm_departments_index = Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_INDEX',
                                                   :page_controller=>'irm/departments',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_departments_index.permissions_tls.build(:language=>'zh',:name=>'设置部门',:description=>'设置部门',:source_lang=>'en')
    irm_departments_index.permissions_tls.build(:language=>'en',:name=>'Department',:description=>'Department',:source_lang=>'en')
    irm_departments_index.save

    irm_departments_new = Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_NEW',
                                                   :page_controller=>'irm/departments',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_departments_new.permissions_tls.build(:language=>'zh',:name=>'新建部门',:description=>'新建部门',:source_lang=>'en')
    irm_departments_new.permissions_tls.build(:language=>'en',:name=>'New Department',:description=>'New Department',:source_lang=>'en')
    irm_departments_new.save

    irm_departments_edit = Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_EDIT',
                                                   :page_controller=>'irm/departments',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_departments_edit.permissions_tls.build(:language=>'zh',:name=>'编辑部门',:description=>'编辑部门',:source_lang=>'en')
    irm_departments_edit.permissions_tls.build(:language=>'en',:name=>'Edit Department',:description=>'Edit Department',:source_lang=>'en')
    irm_departments_edit.save

    irm_departments_create = Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_CREATE',
                                                   :page_controller=>'irm/departments',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_departments_create.permissions_tls.build(:language=>'zh',:name=>'保存部门',:description=>'保存部门',:source_lang=>'en')
    irm_departments_create.permissions_tls.build(:language=>'en',:name=>'Create Department',:description=>'Create Department',:source_lang=>'en')
    irm_departments_create.save

    irm_departments_update = Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_UPDATE',
                                                   :page_controller=>'irm/departments',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_departments_update.permissions_tls.build(:language=>'zh',:name=>'更新部门',:description=>'更新部门',:source_lang=>'en')
    irm_departments_update.permissions_tls.build(:language=>'en',:name=>'Update Department',:description=>'Update Department',:source_lang=>'en')
    irm_departments_update.save

    irm_departments_lang_edit = Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_LANG_EDIT',
                                                   :page_controller=>'irm/departments',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_departments_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑部门多语言',:description=>'编辑部门多语言',:source_lang=>'en')
    irm_departments_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Department Multilingual',:description=>'Edit Department Multilingual',:source_lang=>'en')
    irm_departments_lang_edit.save


    irm_departments_lang_update = Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_LANG_UPDATE',
                                                   :page_controller=>'irm/departments',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_departments_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新部门多语言',:description=>'更新部门多语言',:source_lang=>'en')
    irm_departments_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Department Multilingual',:description=>'Update Department Multilingual',:source_lang=>'en')
    irm_departments_lang_update.save

    irm_departments_get_data = Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_GET_DATA',
                                                   :page_controller=>'irm/departments',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_departments_get_data.permissions_tls.build(:language=>'zh',:name=>'获取部门',:description=>'获取部门',:source_lang=>'en')
    irm_departments_get_data.permissions_tls.build(:language=>'en',:name=>'Get Department',:description=>'Get Department',:source_lang=>'en')
    irm_departments_get_data.save
  end

  def self.down
    #
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/departments")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
