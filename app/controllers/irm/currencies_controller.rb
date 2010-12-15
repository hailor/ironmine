class Irm::CurrenciesController < ApplicationController
  # GET /currencies
  # GET /currencies.xml
  def index
    @currency = Irm::Currency.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currencies }
    end
  end

  # GET /currencies/new
  # GET /currencies/new.xml
  def new
    @currency = Irm::Currency.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @currency }
    end
  end

  # GET /currencies/1/edit
  def edit
    @currency = Irm::Currency.multilingual.find(params[:id])
  end

  # POST /currencies
  # POST /currencies.xml
  def create
    @currency = Irm::Currency.new(params[:irm_currency])

    respond_to do |format|
      if @currency.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "irm/common/_successful_message" }
        format.xml  { render :xml => @currency, :status => :created, :location => @currency }
      else
        @error = @currency
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @currency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /currencies/1
  # PUT /currencies/1.xml
  def update
    @currency = Irm::Currency.find(params[:id])

    respond_to do |format|
      if @currency.update_attributes(params[:irm_currency])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      else
        @error = @currency
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @currency.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multilingual_edit
    @currency = Irm::Currency.find(params[:id])
  end

  def multilingual_update
    @currency = Irm::Currency.find(params[:id])
    @currency.not_auto_mult=true
    respond_to do |format|
      if @currency.update_attributes(params[:irm_currency])
        format.html { render({:action=>"multilingual_edit",:format=>"js"}) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @currencies= Irm::Currency.multilingual.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@currencies.to_dhtmlxgrid_json(['R',:currency_code,:name,:description, :precision,:status_meaning,
                                                             {:value => 'M', :controller => 'irm/currencies',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'id_currency_list', :script => ''}], @currencies.size)}
    end
  end
end
