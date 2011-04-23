module Irm::WatchersHelper
  def ava_watchers(watchable_id, watchable_type)
    if watchable_id && !watchable_id.blank?
      watchable = watchable_type.find(watchable_id)
      (Irm::Person.enabled - watchable.all_person_watchers).collect{|p| [p.name, p.id]}
    else
      Irm::Person.enabled.collect{|p| [p.name, p.id]}
    end
  end

  def watchers_list(watchable)
    watchers = watchable.all_person_watchers
    ret = ""
    watchers.each do |w|
      ret << content_tag(:tr,
                  content_tag(:td,
                              content_tag(:div,
                                          link_to(w.name, {}, {:href => "javascript:void(0);"}), {:style => "float:left"}) + raw("&nbsp;") + icon_link_delete({:controller => "irm/watchers",
                                                                                                                                                               :action => "delete_watcher",
                                                                                                                                                               :watcher_id => w.id,
                                                                                                                                                               :watchable_id => watchable.id,
                                                                                                                                                               :watchable_type => watchable.class.to_s}, :remote => true)))
    end
    raw(ret)
  end

  def watchers_size(watchable)
    watchable.all_person_watchers.size
  end
end