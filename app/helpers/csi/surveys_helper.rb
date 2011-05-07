# -*- coding: utf-8 -*-
module Csi::SurveysHelper
  def get_survey_result(survey_id,response_batch,subject_id)
    @survey_result = Csi::SurveyResult.query_by_survey_id(survey_id,response_batch,subject_id)
    @count = Csi::SurveyResult.query_by_survey_id(survey_id,response_batch,subject_id).count
    @all_survey_result=""
    @survey_result.each do |t|
       if @count.to_i == 1
         @all_survey_result = t[:subject_result]
       else
         @all_survey_result = @all_survey_result + t[:subject_result]+','
       end
    end    
    @all_survey_result
  end


  def check_survey_result_exist?(survey_id)
    @count = Csi::SurveyResult.query_distinct_response_batch(survey_id).count
    if @count > 1
       false
    else
       true
    end
  end

  def get_survey_person(person_id)
    Irm::Person.query_person_name(person_id).query(person_id).first[:person_name]
  end

  #提供构建pie chart 传入的参数width,height
  def pie_chart(id,data_provider,options={})
    width = options[:width]||200
    height = options[:height]||200
    pei_div = content_tag(:div, "",:id=>id,
                          :style=>"width:#{width};height:#{height};margin:10px 10px 10px 10px;")
    colors = options[:colors]||['#194E84','#60BB22','#F2BABB','#FFC200',
                                            '#FF5B00','#B80028','#84002E','#4AC0F2']
    script = %Q(
        (function()
          {
            GY.use('charts', function (Y)
            {
                var pieGraph = new Y.Chart({
                          render:"##{id}",
                          categoryKey:"category",
                          seriesKeys:["value"],
                          dataProvider:#{data_provider},
                          type:"pie",
                          seriesCollection:[
                              {
                                  categoryKey:"category",
                                  valueKey:"value",
                                  styles:{
                                    fill:{
                                        colors:#{colors.inspect}
                                    }
                                   }
                              }
                          ]
                      });
                })
           }           
     )();
    )
    pei_div + javascript_tag(script)
  end


  def show_survey_chart(survey_id)
    survey_subjects = Csi::SurveySubject.query_by_survey_id(survey_id).query_by_choice_input
    survey_chart=""
    i =0
    survey_subjects.each do |subject|
      i = i + 1
      @normal_results = Csi::SurveyResult.query_by_option_type(subject.id,'normal')
      @other_results =  Csi::SurveyResult.query_other_option_type(subject.id,'other')
      result_hash = Hash.new
      @normal_results.inspect
      if @normal_results.present?
         @normal_results.each do |normal_result|
           result_hash.merge!(normal_result[:subject_result]=>normal_result[:result_count])
         end
      end
      if @other_results.present?
         @other_results.each do |other_result|
           result_hash.merge!(other_result[:subject_result]=>other_result[:result_count])
         end
      end
      data_provider = to_chart_json(result_hash)
      subject_title = content_tag(:div,content_tag(:h3,(i.to_s + "." +subject.name).html_safe).html_safe,
                                  :class=>"pbSubheader tertiaryPalette").html_safe
      survey_chart << subject_title + pie_chart("subject"+"#{subject.id}",data_provider,{:width=>"90%"}).html_safe
    end
    survey_chart.html_safe
  end

  #需要回应的调查问卷的task
  def need_response_survey
     survey_task = ""
     current_person_id = Irm::Person.current
     survey_members = Csi::SurveyMember.query_by_person_id(current_person_id).
                                        query_by_response_flag(Irm::Constant::SYS_NO).
                                        query_by_end_date_active
     survey_members.each do |t|
        survey = Csi::Survey.query(t.survey_id).first
        survey_task << content_tag(:li,link_to(t(:label_csi_survey_info)+"："+survey.title,
                                               {:controller=>"csi/surveys",:action=>"reply",
                                                :id=>t.survey_id}))
     end
     if survey_task.blank?
       survey_task << content_tag(:li,t(:label_irm_no_task))
     end
     survey_task
  end

  def show_last_ten_survey
    surveys = Csi::Survey.find_recently_ten
    html_content = ""
    surveys.each do |e|
      html_content << content_tag(:tr, content_tag(:td, link_to(get_list_icon + e.title, {:controller => "csi/surveys", :action => "show", :id => e.id}, {:title => e.title})))
    end
    raw(html_content)
  end



  def my_todo_surveys
    Csi::SurveyMember.list_all.query_by_person(Irm::Person.current.id)
  end
end
