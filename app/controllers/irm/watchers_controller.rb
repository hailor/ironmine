class Irm::WatchersController < ApplicationController
  def add_watcher
    @watchable = eval(params[:watchable_type]).find(params[:watchable_id])
    watcher = Irm::Person.find(params[:watcher])
    @watchable.person_watchers << watcher
    @watchable.save
    respond_to do |format|
      format.js {render :add_watcher}
    end
  end

  def delete_watcher
    @watchable = eval(params[:watchable_type]).find(params[:watchable_id])
    wat = @watchable.watchers.where("member_id = ? AND watchable_id = ? AND watchable_type = ?",
                              params[:watcher_id],
                              params[:watchable_id],
                              params[:watchable_type])
    wat.first.destroy
    respond_to do |format|
      format.js {render :delete_watcher}
    end
  end
end