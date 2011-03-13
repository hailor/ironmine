class Irm::BulletinsController < ApplicationController
  def new
    @bulletin = Irm::Bulletin.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bulletin }
    end
  end

  def create

  end

  def edit
    @bulletin = Irm::Bulletin.find(params[:id])
  end

  def update

  end

  def show
    @bulletin = Irm::Bulletin.where(:id => params[:id]).first()
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bulletin }
    end
  end

  def get_data
    bulletins_scope = Irm::Bulletin.list_all
    bulletins,count = paginate(bulletins_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(bulletins.to_grid_json([:title,:created_at,:page_views,:author], count)) }
    end
  end
end