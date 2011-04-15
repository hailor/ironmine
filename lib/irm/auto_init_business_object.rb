class Irm::AutoInitBusinessObject
  attr_accessor :need_create,:bo_options
  def self.init(need_create=false)
    Dir["#{Rails.root}/app/models/*/*.rb"].each { |file| require file }
    models = ActiveRecord::Base.send(:subclasses)
    models.delete_if{|m| m.table_name.end_with?("s_tl")}
    Irm::BusinessObject.update_all(["auto_generate_flag =?","U"],["auto_generate_flag = ?",Irm::Constant::SYS_YES])
    @current ||= self.new
    @current.need_create = true if need_create||Irm::BusinessObject.count==0
    models.each do |model|
      @current.check_by_model(model)
    end
    Irm::BusinessObject.where("auto_generate_flag =?","U").each do |db|
      db.destroy
    end
  end

  def self.setup_by_model(model,options={})
    model = model.constantize if model.is_a?(String)
    @current ||= self.new
    @current.need_create = true
    @current.bo_options = options
    @current.check_by_model(model)
  end


  def check_by_model(model)
    say("==============check model:#{model.name}==================")
    table_name = model.table_name
    if !ActiveRecord::Base.connection.table_exists?(table_name)
      say("table not exists #{table_name}")
      return
    end
    multilingual_flag = Irm::Constant::SYS_NO
    if model.respond_to?(:multilingual)&&model.respond_to?(:view_name)
      table_name = model.view_name
      multilingual_flag=Irm::Constant::SYS_YES
    end
    say("find table:#{table_name}")
    Irm::BusinessObject.update_all(["auto_generate_flag =?",Irm::Constant::SYS_YES],["bo_table_name=? AND bo_model_name=? AND auto_generate_flag = ?",table_name,model.name,"U"])
    exists_ob = Irm::BusinessObject.where(:auto_generate_flag=>"Y",:bo_table_name=>table_name,:bo_model_name=>model.name).first
    if exists_ob
      say("already exists business object for #{model.name} #{table_name}")
      check_bo_attribute(exists_ob)
      say("update business object for #{model.name} #{table_name}")
      exists_ob.update_attributes({:not_auto_mult=>true,:multilingual_flag=>multilingual_flag})
    else
      say("not exists business object for #{model.name} #{table_name}")
      add_bo(model)
    end
    say("==============end check model:#{model.name}==================")
  end

  def check_bo_attribute(bo)
    say("check existsed bo for #{bo.bo_model_name} #{bo.bo_table_name}")
    exists_columns = get_table_columns(bo.bo_table_name)
    columns = exists_columns.dup
    object_attributes = bo.object_attributes
    object_attributes.each do |oa|
      if !oa.attribute_type.eql?("TABLE_COLUMN")
        say("NOT TABLE COLUMN  #{bo.bo_model_name}==#{oa.attribute_name}")
        next
      end
      column = columns.detect{|c| c[0].eql?(oa.attribute_name)}
      if column
        data_type_length = column[1].split("(")
        data_type = data_type_length[0]
        length = nil
        length = data_type_length[1].gsub(/\)/,"") if data_type_length[1]
        oa.update_attributes({:not_auto_mult=>true,
                              :data_type=>data_type,
                              :data_length=>length,
                              :nullable_flag=>("NO".eql?(column[2]) ? Irm::Constant::SYS_NO : Irm::Constant::SYS_YES),
                              :key_type=>column[3],
                              :default_value=>column[4],
                              :extra_info=>column[5]})
        say("update column=#{bo.bo_table_name}==#{oa.attribute_name}")
        columns.delete_if{|c| c[0].eql?(oa.attribute_name)}
      else
        say("delete #{bo.bo_table_name}==#{oa.attribute_name}")
        oa.destroy
        next
      end
    end

    columns.each do |c|
      data_type_length = c[1].split("(")
      data_type = data_type_length[0]
      length = nil
      length = data_type_length[1].gsub(/\)/,"") if data_type_length[1]
      attribute = Irm::ObjectAttribute.create({:business_object_code=>bo.business_object_code,
                                              :name=>c[0],
                                              :description=>c[0],
                                              :attribute_name=>c[0],
                                              :attribute_type=>"TABLE_COLUMN",
                                              :exists_relation_flag=>Irm::Constant::SYS_NO,
                                              :data_type=>data_type,
                                              :data_length=>length,
                                              :nullable_flag=>("NO".eql?(c[2]) ? Irm::Constant::SYS_NO : Irm::Constant::SYS_YES),
                                              :key_type=>c[3],
                                              :default_value=>c[4],
                                              :extra_info=>c[5]})
      say("add column=#{bo.bo_table_name}==#{attribute.attribute_name}")
    end
    check_column(bo.business_object_code,exists_columns)
  end

  def check_column(bo_code,columns)
    attributes = Irm::ObjectAttribute.where(:relation_bo_code=>bo_code,:attribute_type=>"RELATION_COLUMN")
    attributes.each do |oa|
      column = columns.detect{|c| c[0].eql?(oa.attribute_name)}
      if column
        data_type_length = column[1].split("(")
        data_type = data_type_length[0]
        length = nil
        length = data_type_length[1].gsub(/\)/,"") if data_type_length[1]
        oa.update_attributes({:not_auto_mult=>true,
                              :data_type=>data_type,
                              :data_length=>length,
                              :nullable_flag=>("NO".eql?(column[2]) ? Irm::Constant::SYS_NO : Irm::Constant::SYS_YES),
                              :key_type=>column[3],
                              :default_value=>column[4],
                              :extra_info=>column[5]})
        say("update ref attribute #{bo_code}==#{oa.attribute_name}")
      else
        say("delete ref attribute #{bo_code}==#{oa.attribute_name}")
        oa.destroy
      end
    end
  end

  def add_bo(model)
    if !need_create
      say "can not create new business object for #{model.name},please check"
      return
    end
    table_name = model.table_name
    multilingual_flag = Irm::Constant::SYS_NO
    if model.respond_to?(:multilingual)&&model.respond_to?(:view_name)
      table_name = model.view_name
      multilingual_flag=Irm::Constant::SYS_YES
    end
    if !ActiveRecord::Base.connection.table_exists?(table_name)
        say("table not exists #{table_name},please check!")
        return
      end
    business_object_code = table_name.slice(table_name.length-30> 0 ? table_name.length-30 : 0  ,table_name.length).upcase
    business_object_code = business_object_code.slice(1,business_object_code.length) if business_object_code[0].eql?("_")

    bo_create_options ={:business_object_code=>business_object_code,
                        :description=>table_name,:name=>table_name,
                        :auto_generate_flag=>Irm::Constant::SYS_YES,
                        :bo_table_name=>table_name,
                        :bo_model_name=>model.name,
                        :multilingual_flag=>multilingual_flag}
    bo_create_options.merge!(bo_options) if bo_options
    bo = Irm::BusinessObject.new(bo_create_options)
    columns = get_table_columns(table_name)
    columns.each do |c|
      data_type_length = c[1].split("(")
      data_type = data_type_length[0]
      length = nil
      length = data_type_length[1].gsub(/\)/,"") if data_type_length[1]
      attribute = bo.object_attributes.build({:business_object_code=>business_object_code,
                                              :name=>c[0],
                                              :description=>c[0],
                                              :attribute_name=>c[0],
                                              :attribute_type=>"TABLE_COLUMN",
                                              :exists_relation_flag=>Irm::Constant::SYS_NO,
                                              :data_type=>data_type,
                                              :data_length=>length,
                                              :nullable_flag=>("NO".eql?(c[2]) ? Irm::Constant::SYS_NO : Irm::Constant::SYS_YES),
                                              :key_type=>c[3],
                                              :default_value=>c[4],
                                              :extra_info=>c[5]})
      say("add =column=#{bo.bo_table_name}==#{attribute.attribute_name}")
    end
    bo.save
    if bo.errors.any?
      say("errors====#{bo.errors}")
      bo.object_attributes.each do |oa|
        say("object_attribute errors=#{oa.attribute_name}=#{oa.errors}")if oa.errors.any?
      end
    end
  end
  private
  def get_table_columns(table_name)
    columns = []
    tcs = ActiveRecord::Base.connection.execute("DESCRIBE  #{table_name}")
    tcs.each do |c|
      columns << c
    end
    columns
  end

  def say(msg)
    @message||=""
    @message+=(msg+"\n")
    puts(msg)
  end

  def message
    @message||""
  end
end