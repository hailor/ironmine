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
    Irm::Person.query_person_name(person_id).first[:person_name]
  end

  def pei_chart(id,options={})
    width = options[:width]||200
    height = options[:height]||200
    data_provider = options[:data_provider]
    pei_div = content_tag(:div, "",:id=>id,:style=>"width:#{width}px;height:#{height}px;margin:10px 10px 10px 10px;")
    script = %Q(
        (function()
          {
            GY.use('charts', function (Y)
            {
                var myDataValues = [
                        {category:"Monday", value:2000},
                        {category:"Tuesday", value:2000},
                        {category:"Wednesday", value:1000},
                        {category:"Thursday", value:200},
                        {category:"Friday", value:2000}
                ];
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
                                        colors:['#194E84','#60BB22','#F2BABB','#FFC200',
                                            '#FF5B00','#B80028','#84002E','#4AC0F2']
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
end
