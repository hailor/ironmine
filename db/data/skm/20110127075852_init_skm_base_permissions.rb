# -*- coding: utf-8 -*-
class InitSkmBasePermissions < ActiveRecord::Migration
  def self.up
    skm_product = Irm::ProductModule.new({:product_short_name=>"SKM",:installed_flag=>"Y",:not_auto_mult=>true})
    skm_product.product_modules_tls.build({:name=>"Service Knowledge Manager",
                                    :description=>"Service Knowledge Manager",
                                    :language=>"en",
                                    :source_lang=>"en"})
    skm_product.product_modules_tls.build({:name=>"知识库模块",
                                    :description=>"知识库模块",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    skm_product.save    
    skm_entry_headers_create= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_CREATE',:page_controller=>'skm/entry_headers',:page_action=>'create',:not_auto_mult=>true)
    skm_entry_headers_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_headers_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_headers_create.save
    skm_entry_headers_edit= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_EDIT',:page_controller=>'skm/entry_headers',:page_action=>'edit',:not_auto_mult=>true)
    skm_entry_headers_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_headers_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_headers_edit.save
    skm_entry_headers_get_data= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_GET_DATA',:page_controller=>'skm/entry_headers',:page_action=>'get_data',:not_auto_mult=>true)
    skm_entry_headers_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    skm_entry_headers_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    skm_entry_headers_get_data.save
    skm_entry_headers_get_his_da= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_GET_HIS_DA',:page_controller=>'skm/entry_headers',:page_action=>'get_history_entries_data',:not_auto_mult=>true)
    skm_entry_headers_get_his_da.permissions_tls.build(:language=>'zh',:name=>'得到历史文章数据',:description=>'得到历史文章数据',:source_lang=>'en')
    skm_entry_headers_get_his_da.permissions_tls.build(:language=>'en',:name=>'Get History Entries',:description=>'Get History Entries',:source_lang=>'en')
    skm_entry_headers_get_his_da.save
    skm_entry_headers_index= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_INDEX',:page_controller=>'skm/entry_headers',:page_action=>'index',:not_auto_mult=>true)
    skm_entry_headers_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    skm_entry_headers_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    skm_entry_headers_index.save
    skm_entry_headers_index_search= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_INDEX_SEARCH',:page_controller=>'skm/entry_headers',:page_action=>'index_search',:not_auto_mult=>true)
    skm_entry_headers_index_search.permissions_tls.build(:language=>'zh',:name=>'搜索',:description=>'搜索',:source_lang=>'en')
    skm_entry_headers_index_search.permissions_tls.build(:language=>'en',:name=>'Search',:description=>'Search',:source_lang=>'en')
    skm_entry_headers_index_search.save
    skm_entry_headers_indse_get_da= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_INDSE_GET_DA',:page_controller=>'skm/entry_headers',:page_action=>'index_search_get_data',:not_auto_mult=>true)
    skm_entry_headers_indse_get_da.permissions_tls.build(:language=>'zh',:name=>'得到搜索结果',:description=>'得到搜索结果',:source_lang=>'en')
    skm_entry_headers_indse_get_da.permissions_tls.build(:language=>'en',:name=>'Get Search Result',:description=>'Get Search Result',:source_lang=>'en')
    skm_entry_headers_indse_get_da.save
    skm_entry_headers_new= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_NEW',:page_controller=>'skm/entry_headers',:page_action=>'new',:not_auto_mult=>true)
    skm_entry_headers_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_headers_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_headers_new.save
    skm_entry_headers_new_step_1= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_NEW_STEP_1',:page_controller=>'skm/entry_headers',:page_action=>'new_step_1',:not_auto_mult=>true)
    skm_entry_headers_new_step_1.permissions_tls.build(:language=>'zh',:name=>'创建 第一步',:description=>'创建 第一步',:source_lang=>'en')
    skm_entry_headers_new_step_1.permissions_tls.build(:language=>'en',:name=>'Create, Step 1',:description=>'Create, Step 1',:source_lang=>'en')
    skm_entry_headers_new_step_1.save
    skm_entry_headers_new_step_2= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_NEW_STEP_2',:page_controller=>'skm/entry_headers',:page_action=>'new_step_2',:not_auto_mult=>true)
    skm_entry_headers_new_step_2.permissions_tls.build(:language=>'zh',:name=>'创建 第二步',:description=>'创建 第二步',:source_lang=>'en')
    skm_entry_headers_new_step_2.permissions_tls.build(:language=>'en',:name=>'Create, Step 2',:description=>'Create, Step 2',:source_lang=>'en')
    skm_entry_headers_new_step_2.save
    skm_entry_headers_new_step_3= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_NEW_STEP_3',:page_controller=>'skm/entry_headers',:page_action=>'new_step_3',:not_auto_mult=>true)
    skm_entry_headers_new_step_3.permissions_tls.build(:language=>'zh',:name=>'创建 第三步',:description=>'创建 第三步',:source_lang=>'en')
    skm_entry_headers_new_step_3.permissions_tls.build(:language=>'en',:name=>'Create, Step 3',:description=>'Create, Step 3',:source_lang=>'en')
    skm_entry_headers_new_step_3.save
    skm_entry_headers_new_step_4= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_NEW_STEP_4',:page_controller=>'skm/entry_headers',:page_action=>'new_step_4',:not_auto_mult=>true)
    skm_entry_headers_new_step_4.permissions_tls.build(:language=>'zh',:name=>'创建 第四步',:description=>'创建 第四步',:source_lang=>'en')
    skm_entry_headers_new_step_4.permissions_tls.build(:language=>'en',:name=>'Create, Step 4',:description=>'Create, Step 4',:source_lang=>'en')
    skm_entry_headers_new_step_4.save
    skm_entry_headers_show= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_SHOW',:page_controller=>'skm/entry_headers',:page_action=>'show',:not_auto_mult=>true)
    skm_entry_headers_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    skm_entry_headers_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    skm_entry_headers_show.save
    skm_entry_headers_update= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_UPDATE',:page_controller=>'skm/entry_headers',:page_action=>'update',:not_auto_mult=>true)
    skm_entry_headers_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_headers_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_headers_update.save
    skm_entry_statuses_create= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_CREATE',:page_controller=>'skm/entry_statuses',:page_action=>'create',:not_auto_mult=>true)
    skm_entry_statuses_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_statuses_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_statuses_create.save
    skm_entry_statuses_edit= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_EDIT',:page_controller=>'skm/entry_statuses',:page_action=>'edit',:not_auto_mult=>true)
    skm_entry_statuses_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_statuses_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_statuses_edit.save
    skm_entry_statuses_get_data= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_GET_DATA',:page_controller=>'skm/entry_statuses',:page_action=>'get_data',:not_auto_mult=>true)
    skm_entry_statuses_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    skm_entry_statuses_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    skm_entry_statuses_get_data.save
    skm_entry_statuses_index= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_INDEX',:page_controller=>'skm/entry_statuses',:page_action=>'index',:not_auto_mult=>true)
    skm_entry_statuses_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    skm_entry_statuses_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    skm_entry_statuses_index.save
    skm_entry_statuses_new= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_NEW',:page_controller=>'skm/entry_statuses',:page_action=>'new',:not_auto_mult=>true)
    skm_entry_statuses_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_statuses_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_statuses_new.save
    skm_entry_statuses_show= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_SHOW',:page_controller=>'skm/entry_statuses',:page_action=>'show',:not_auto_mult=>true)
    skm_entry_statuses_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    skm_entry_statuses_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    skm_entry_statuses_show.save
    skm_entry_statuses_update= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_UPDATE',:page_controller=>'skm/entry_statuses',:page_action=>'update',:not_auto_mult=>true)
    skm_entry_statuses_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_statuses_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_statuses_update.save
    skm_entry_statuses_mu_ed= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_MU_ED',:page_controller=>'skm/entry_statuses',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    skm_entry_statuses_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    skm_entry_statuses_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    skm_entry_statuses_mu_ed.save
    skm_entry_statuses_mu_ud= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_MU_UD',:page_controller=>'skm/entry_statuses',:page_action=>'multilingual_update',:not_auto_mult=>true)
    skm_entry_statuses_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    skm_entry_statuses_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    skm_entry_statuses_mu_ud.save
    skm_entry_templates_add_ele= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_ADD_ELE',:page_controller=>'skm/entry_templates',:page_action=>'add_elements',:not_auto_mult=>true)
    skm_entry_templates_add_ele.permissions_tls.build(:language=>'zh',:name=>'添加元素',:description=>'添加元素',:source_lang=>'en')
    skm_entry_templates_add_ele.permissions_tls.build(:language=>'en',:name=>'Add Elements',:description=>'Add Elements',:source_lang=>'en')
    skm_entry_templates_add_ele.save
    skm_entry_templates_create= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_CREATE',:page_controller=>'skm/entry_templates',:page_action=>'create',:not_auto_mult=>true)
    skm_entry_templates_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_templates_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_templates_create.save
    skm_entry_templates_down_ele= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_DOWN_ELE',:page_controller=>'skm/entry_templates',:page_action=>'down_element',:not_auto_mult=>true)
    skm_entry_templates_down_ele.permissions_tls.build(:language=>'zh',:name=>'下移元素',:description=>'下移元素',:source_lang=>'en')
    skm_entry_templates_down_ele.permissions_tls.build(:language=>'en',:name=>'Move Down',:description=>'Move Down',:source_lang=>'en')
    skm_entry_templates_down_ele.save
    skm_entry_templates_edit= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_EDIT',:page_controller=>'skm/entry_templates',:page_action=>'edit',:not_auto_mult=>true)
    skm_entry_templates_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_templates_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_templates_edit.save
    skm_entry_templates_get_av_ele= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_GET_AV_ELE',:page_controller=>'skm/entry_templates',:page_action=>'get_available_elements',:not_auto_mult=>true)
    skm_entry_templates_get_av_ele.permissions_tls.build(:language=>'zh',:name=>'得到可用元素',:description=>'得到可用元素',:source_lang=>'en')
    skm_entry_templates_get_av_ele.permissions_tls.build(:language=>'en',:name=>'Get Available Elements',:description=>'Get Available Elements',:source_lang=>'en')
    skm_entry_templates_get_av_ele.save
    skm_entry_templates_get_data= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_GET_DATA',:page_controller=>'skm/entry_templates',:page_action=>'get_data',:not_auto_mult=>true)
    skm_entry_templates_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    skm_entry_templates_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    skm_entry_templates_get_data.save
    skm_entry_templates_own_el_da= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_OWN_EL_DA',:page_controller=>'skm/entry_templates',:page_action=>'get_owned_elements_data',:not_auto_mult=>true)
    skm_entry_templates_own_el_da.permissions_tls.build(:language=>'zh',:name=>'得到已有元素',:description=>'得到已有元素',:source_lang=>'en')
    skm_entry_templates_own_el_da.permissions_tls.build(:language=>'en',:name=>'Get Owned Elements',:description=>'Get Owned Elements',:source_lang=>'en')
    skm_entry_templates_own_el_da.save
    skm_entry_templates_index= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_INDEX',:page_controller=>'skm/entry_templates',:page_action=>'index',:not_auto_mult=>true)
    skm_entry_templates_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    skm_entry_templates_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    skm_entry_templates_index.save
    skm_entry_templates_new= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_NEW',:page_controller=>'skm/entry_templates',:page_action=>'new',:not_auto_mult=>true)
    skm_entry_templates_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_templates_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_templates_new.save
    skm_entry_templates_remove_ele= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_REMOVE_ELE',:page_controller=>'skm/entry_templates',:page_action=>'remove_element',:not_auto_mult=>true)
    skm_entry_templates_remove_ele.permissions_tls.build(:language=>'zh',:name=>'移除元素',:description=>'移除元素',:source_lang=>'en')
    skm_entry_templates_remove_ele.permissions_tls.build(:language=>'en',:name=>'Remove Elements',:description=>'Remove Elements',:source_lang=>'en')
    skm_entry_templates_remove_ele.save
    skm_entry_templates_select_ele= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_SELECT_ELE',:page_controller=>'skm/entry_templates',:page_action=>'select_elements',:not_auto_mult=>true)
    skm_entry_templates_select_ele.permissions_tls.build(:language=>'zh',:name=>'选择元素',:description=>'选择元素',:source_lang=>'en')
    skm_entry_templates_select_ele.permissions_tls.build(:language=>'en',:name=>'Select Elements',:description=>'Select Elements',:source_lang=>'en')
    skm_entry_templates_select_ele.save
    skm_entry_templates_show= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_SHOW',:page_controller=>'skm/entry_templates',:page_action=>'show',:not_auto_mult=>true)
    skm_entry_templates_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    skm_entry_templates_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    skm_entry_templates_show.save
    skm_entry_templates_update= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_UPDATE',:page_controller=>'skm/entry_templates',:page_action=>'update',:not_auto_mult=>true)
    skm_entry_templates_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_templates_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_templates_update.save
    skm_entry_templates_up_element= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_UP_ELEMENT',:page_controller=>'skm/entry_templates',:page_action=>'up_element',:not_auto_mult=>true)
    skm_entry_templates_up_element.permissions_tls.build(:language=>'zh',:name=>'上移元素',:description=>'上移元素',:source_lang=>'en')
    skm_entry_templates_up_element.permissions_tls.build(:language=>'en',:name=>'Move Up',:description=>'Move Up',:source_lang=>'en')
    skm_entry_templates_up_element.save
    skm_entry_template_ele_create= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_CREATE',:page_controller=>'skm/entry_template_elements',:page_action=>'create',:not_auto_mult=>true)
    skm_entry_template_ele_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_template_ele_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_template_ele_create.save
    skm_entry_template_ele_edit= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_EDIT',:page_controller=>'skm/entry_template_elements',:page_action=>'edit',:not_auto_mult=>true)
    skm_entry_template_ele_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_template_ele_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_template_ele_edit.save
    skm_entry_template_ele_get_da= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_GET_DA',:page_controller=>'skm/entry_template_elements',:page_action=>'get_data',:not_auto_mult=>true)
    skm_entry_template_ele_get_da.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    skm_entry_template_ele_get_da.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    skm_entry_template_ele_get_da.save
    skm_entry_template_ele_index= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_INDEX',:page_controller=>'skm/entry_template_elements',:page_action=>'index',:not_auto_mult=>true)
    skm_entry_template_ele_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    skm_entry_template_ele_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    skm_entry_template_ele_index.save
    skm_entry_template_ele_new= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_NEW',:page_controller=>'skm/entry_template_elements',:page_action=>'new',:not_auto_mult=>true)
    skm_entry_template_ele_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_template_ele_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_template_ele_new.save
    skm_entry_template_ele_show= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_SHOW',:page_controller=>'skm/entry_template_elements',:page_action=>'show',:not_auto_mult=>true)
    skm_entry_template_ele_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    skm_entry_template_ele_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    skm_entry_template_ele_show.save
    skm_entry_template_ele_update= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_UPDATE',:page_controller=>'skm/entry_template_elements',:page_action=>'update',:not_auto_mult=>true)
    skm_entry_template_ele_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_template_ele_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_template_ele_update.save    
  end

  def self.down
  end
end
