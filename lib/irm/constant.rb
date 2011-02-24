# 系统中使用的常量放在此文件中
# 如果是需要设置的应该放在config\initializers\init_ironmine.rb文件中，方便修改
module Irm
  module Constant
    #数据可用标记
    ENABLED = "ENABLED"
    DISABLED = "DISABLED"
    #整个系统中进行SYS_YES
    SYS_YES = 'Y'
    SYS_NO = 'N'

    #规则类似ebs中的快码，针对于global类型只能
    #用数据库脚本进入，属于系统级别
    #EXTENDED类型可以扩展，但是
    #user属于用户级别，可以任意修改
    GLOBAL_LOOKUP_LEVEL='GLOBAL'
    EXTENDED_LOOKUP_LEVEL='EXTENDED'
    USER_LOOKUP_LEVEL='USER'

    # 顶层菜单
    TOP_SETTING_MENU = 'IRM_SETTING_ENTRANCE_MENU'
    TOP_BUSSINESS_MENU = 'IRM_ENTRANCE_MENU'
    LOGINED_ROLE = 'IRM_LOGINED_ROLE'
    PUBLICED_ROLE  = 'IRM_PUBLICED_ROLE'
    # 人员 角色之间的关联类型
    ACCESS_VIEW = 'VIEW'
    ACCESS_EDIT_VIEW = 'EDIT_VIEW'
    ACCESS_NONE = 'NONE'
    EDIT_ACTION = ['new','create','edit','update']
  end
end