module Slm::ServiceBreaksHelper
  def get_time_hour (value)
        value[0,2].to_i
  end

  def get_time_minute (value)
        value[3,2].to_i
  end

  def get_time_second (value)
        value[6,2].to_i
  end
end