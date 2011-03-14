class Irm::BulletinsController < ApplicationController
  def new
    @bulletin = Irm::Bulletin.new
    @return_url=request.env['HTTP_REFERER']
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bulletin }
    end
  end

  def create
    @bulletin = Irm::Bulletin.new(params[:irm_bulletin])
    respond_to do |format|
      if @bulletin.save
        format.html {
          if(params[:return_url])
            redirect_to params[:return_url]
          else
            redirect_to({:action=>"index"}, :notice =>t(:successfully_created))
          end
          }
        format.xml  { render :xml => @bulletin, :status => :created, :location => @bulletin }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bulletin.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @bulletin = Irm::Bulletin.find(params[:id])
  end

  def update
    @bulletin = Irm::Bulletin.find(params[:id])

    respond_to do |format|
      if @bulletin.update_attributes(params[:irm_bulletin])
        format.html {
          if(params[:return_url])
            redirect_to params[:return_url]
          else
            render "index"
          end
        }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bulletin.errors, :status => :unprocessable_entity }
      end
    end
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

  def index

  end
end