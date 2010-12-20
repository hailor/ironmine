module DemoHelper
  def generate_demo_drop_down
    d_data = Irm::OperationalCatalog.list_all.enabled
    m1 = ""
    i = 0
    d_data.group_by{|s| s.segment1}.sort.each do |segment1, records1|
      i += 1
      m2 = ""
      d_data.where(:segment1 => segment1).where("segment2 IS NOT NULL AND segment2 <> ''").group_by{|s| s.segment2}.sort.each do |segment2, records2|
        i += 1
        m3 = ""
        d_data.where(:segment2 => segment2).where("segment3 IS NOT NULL AND segment3 <> ''").group_by{|s| s.segment3}.sort.each do |segment3, records3|
          i += 1
          m3 += content_tag(:li, raw(records3[0].segment3_name), {:rel => i})
        end
        m2 += content_tag(:li, raw(records2[0].segment2_name) + content_tag(:ul, raw(m3)), {:rel => i})
      end
      m1 += content_tag(:li, raw(records1[0].segment1_name) + (content_tag(:ul, raw(m2))), {:rel => i})
    end
    content_tag(:ul, raw(m1), {:id => "categorymenu", :class => "mcdropdown_menu"})
  end
end