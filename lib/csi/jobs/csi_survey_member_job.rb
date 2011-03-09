module Csi
  module Jobs
    class CsiSurveyMemberJob < Struct.new(:survey_range_id)
      #调查范围设计的组织维度，角色维度以及地点维度来找到相应的人员
      #从而进行相应的调查范围成员确定。
      #确保每一个调查问卷针对于同一人都只调查一次，根据调查问卷的结果来进行判断

    end
  end
end