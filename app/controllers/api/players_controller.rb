class Api::PlayersController < ApplicationController
  # GET /api_players
  # GET /api_players.xml
  def index
    puts params.inspect
    @api_players = Player.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @api_players }
    end
  end

  # GET /api_players/1
  # GET /api_players/1.xml
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /api_players/new
  # GET /api_players/new.xml
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /api_players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /api_players
  # POST /api_players.xml
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        flash[:notice] = 'Api::Player was successfully created.'
        format.html { redirect_to(@player) }
        format.xml  { render :xml => @player, :status => :created, :location => @player }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /api_players/1
  # PUT /api_players/1.xml
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        flash[:notice] = 'Api::Player was successfully updated.'
        format.html { redirect_to(@player) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /api_players/1
  # DELETE /api_players/1.xml
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to(api_players_url) }
      format.xml  { head :ok }
    end
  end

  def with_login
    @player = Player.find_by_login(params[:login])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @player }
    end

  end
end
