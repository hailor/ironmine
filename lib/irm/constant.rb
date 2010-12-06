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
  end
end