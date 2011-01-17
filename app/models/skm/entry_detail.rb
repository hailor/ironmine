class Skm::EntryDetail < ActiveRecord ::Base
  set_table_name :skm_entry_details



  def next_line_num(template_id)
    Skm::EntryDetail.where(:entry_template_id => template_id).order("line_num DESC").first().line_num + 1
  rescue
    1
  end

  
end