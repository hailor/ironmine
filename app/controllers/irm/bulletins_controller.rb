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
    @bulletin.author_id = Irm::Person.current.id
    @bulletin.page_views = 0
    respond_to do |format|
      if @bulletin.save
        if params[:accesses] && params[:accesses].size > 0
          rec_array = []
          params[:accesses].each do |t|
            rec_array << t[1]
          end
          rec_array = rec_array.uniq
          bulletin_accesses = []
          rec_array.each do |t|
             bulletin_accesses << Irm::BulletinAccess.new({:bulletin_id => @bulletin.id,
                                                 :access_type => t[:type],
                                                 :access_id => t[:access_id]})
          end
          bulletin_accesses.each do |t|
            t.save
          end
        end
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
        @bulletin.bulletin_accesses.each do |t|
          t.destroy
        end
        if params[:accesses] && params[:accesses].size > 0
          rec_array = []
          params[:accesses].each do |t|
            rec_array << t[1]
          end
          rec_array = rec_array.uniq
          bulletin_accesses = []
          rec_array.each do |t|
             bulletin_accesses << Irm::BulletinAccess.new({:bulletin_id => @bulletin.id,
                                                 :access_type => t[:type],
                                                 :access_id => t[:access_id]})
          end
          bulletin_accesses.each do |t|
            t.save
          end
        end
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
#    bulletins_scope = Irm::Bulletin.list_all
    rec = Irm::Bulletin.list_accessible(Irm::Person.current.id)
#    bulletins,count = paginate(rec)
    respond_to do |format|
      format.json  {render :json => to_jsonp(rec.to_grid_json([:id, :bulletin_title,:published_date,:page_views,:author], 5)) }
    end
  end

  def index

  end

  def access_company_select
    @return_url=params[:return_url]||request.env['HTTP_REFERER']
    @bulletin = Irm::Bulletin.find(params[:bulletin_id])
  end

  def access_department_select
    @return_url=params[:return_url]||request.env['HTTP_REFERER']
    @bulletin = Irm::Bulletin.find(params[:bulletin_id])
  end

  def access_role_select
    @return_url=params[:return_url]||request.env['HTTP_REFERER']
    @bulletin = Irm::Bulletin.find(params[:bulletin_id])
  end

  def get_ava_departments
    departments_scope = Irm::Department.multilingual.enabled.where("company_id = ?", params[:company_id])
    department = departments_scope.collect{|i| {:label=>i[:name], :value=>i.id,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>department.to_grid_json([:label,:value], department.count)}
    end
  end
end