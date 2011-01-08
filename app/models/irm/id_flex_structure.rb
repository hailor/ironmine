class Irm::IdFlexStructure < ActiveRecord::Base
  set_table_name :irm_id_flex_structures
  
  #多语言关系
  attr_accessor :id_flex_structure_name,:description
  has_many :id_flex_structures_tls,:dependent => :destroy
  acts_as_multilingual(:columns =>[:id_flex_structure_name,:description], :required=>[:id_flex_structure_name])

  validates_presence_of :id_flex_structure_code
  validates_uniqueness_of :id_flex_structure_code
  scope :query_by_flex_code, lambda{|flex_code| where("#{table_name}.id_flex_code = ?", flex_code)}

  scope :list_all, lambda{select("#{table_name}.*, #{Irm::IdFlex.table_name}.id_flex_name id_flex_name, #{Irm::IdFlexStructuresTl.table_name}.id_flex_structure_name id_flex_structure_name, #{Irm::IdFlexStructuresTl.table_name}.description description").
                          joins(",#{Irm::IdFlex.table_name}, #{Irm::IdFlexStructuresTl.table_name}").
                          where("#{Irm::IdFlex.table_name}.id_flex_code = #{table_name}.id_flex_code").
                          where("#{Irm::IdFlexStructuresTl.table_name}.id_flex_structure_id = #{table_name}.id").
                          where("#{Irm::IdFlexStructuresTl.table_name}.language = ?", I18n.locale)}
  def self.generate_flex_num(flex_code)
    list = Irm::IdFlexStructure.query_by_flex_code(flex_code).find(:order => 'id_flex_structure_num DESC')
    
    if list.any? && !list.first().id_flex_num.blank?
      num = list.first().id_flex_num + 1
    else
      num = 100
    end
    num
  rescue ActiveRecord::RecordNotFound
    100
  end

  def id_flex_segments
    Irm::IdFlexSegment.list_all(self.id)
  end
end
