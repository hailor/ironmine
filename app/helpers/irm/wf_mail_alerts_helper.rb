module Irm::WfMailAlertsHelper
  def available_mail_alert_recipient_type
    Irm::LookupValue.query_by_lookup_type("WF_MAIL_ALERT_RECIPIENT_TYPE").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end
end
