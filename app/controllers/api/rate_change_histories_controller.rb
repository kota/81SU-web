class Api::RateChangeHistoriesController < ApplicationController
  # GET /rate_change_histories
  # GET /rate_change_histories.xml
  def index
    @rate_change_histories = RateChangeHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rate_change_histories }
    end
  end

  # GET /rate_change_histories/1
  # GET /rate_change_histories/1.xml
  def show
    @rate_change_history = RateChangeHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rate_change_history }
    end
  end

  # GET /rate_change_histories/new
  # GET /rate_change_histories/new.xml
  def new
    @rate_change_history = RateChangeHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rate_change_history }
    end
  end

  # GET /rate_change_histories/1/edit
  def edit
    @rate_change_history = RateChangeHistory.find(params[:id])
  end

  # POST /rate_change_histories
  # POST /rate_change_histories.xml
  def create
    @rate_change_history = RateChangeHistory.new(params[:rate_change_history])

    respond_to do |format|
      if @rate_change_history.save
        flash[:notice] = 'RateChangeHistory was successfully created.'
        format.html { redirect_to(@rate_change_history) }
        format.xml  { render :xml => @rate_change_history, :status => :created }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rate_change_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rate_change_histories/1
  # PUT /rate_change_histories/1.xml
  def update
    @rate_change_history = RateChangeHistory.find(params[:id])

    respond_to do |format|
      if @rate_change_history.update_attributes(params[:rate_change_history])
        flash[:notice] = 'RateChangeHistory was successfully updated.'
        format.html { redirect_to(@rate_change_history) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rate_change_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rate_change_histories/1
  # DELETE /rate_change_histories/1.xml
  def destroy
    @rate_change_history = RateChangeHistory.find(params[:id])
    @rate_change_history.destroy

    respond_to do |format|
      format.html { redirect_to(rate_change_histories_url) }
      format.xml  { head :ok }
    end
  end

  def search
    @rate_change_histories = Array.new
    @rate_change_histories = RateChangeHistory.find(:all, :order => "rate_change_histories.id DESC",
                       :conditions => ["players.login = ?",params[:name]],
                       :include => :player, :limit => 100)

    respond_to do |format|
      format.xml
    end
  end

end
