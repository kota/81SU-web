class Api::PlayersController < ApplicationController
  include AuthenticatedSystem
  before_filter :activeresource_auth, :only => [:update,:destroy]

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
      params[:player].delete('country')
      params[:player].delete('auth_token')
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
      format.xml  { render :xml => @player.to_xml(:include => :country) }
    end

  end
  
  def search
    @api_players = Array.new
    Player.all.each { |p|
      if (p.login.include?(params[:name])) then
        @api_players.push(p)
      end
      break if @api_players.size > 100
    }
    respond_to do |format|
      format.xml
    end
  end
  
  def detail
    @player = Player.find(:all, :conditions => ['login = ?',params[:name]])

    respond_to do |format|
      format.xml  { render :xml => @player }
    end
  end
  
  def ranking
    case params[:item]
    when "rate"
      @api_players = Player.ranked.sort_by { |v| - ( v.wins + v.losses ) }
      @api_players = @api_players.sort_by { |v| - v.rate }
    when "wins"
      @api_players = Player.ranked.sort_by { |v| - v.rate }
      @api_players = @api_players.sort_by { |v| v.losses }
      @api_players = @api_players.sort_by { |v| - v.wins }
    when "total"
      @api_players = Player.ranked.sort_by { |v| - v.rate }
      @api_players = @api_players.sort_by { |v| v.losses }
      @api_players = @api_players.sort_by { |v| - ( v.wins + v.losses ) }
    when "percentage"
      @api_players = Player.ranked.sort_by { |v| - v.rate }
      @api_players = @api_players.sort_by { |v| - ( v.wins + v.losses ) }
      @api_players = @api_players.sort_by { |v| - ( v.wins.to_f / [1, v.wins + v.losses].max ) }
    when "streak"
      @api_players = Player.ranked.sort_by { |v| - v.rate }
      @api_players = @api_players.sort_by { |v| - v.streak_best }
    else
      @api_players = Array.new
    end

    respond_to do |format|
      format.xml
    end
  end

  def ranking34
    case params[:item]
    when "exp"
      @api_players = Player.ranked.sort_by { |v| - v.wins34 }
      @api_players = @api_players.sort_by { |v| - v.exp34 }
    when "wins"
      @api_players = Player.ranked.sort_by { |v| v.losses34 }
      @api_players = @api_players.sort_by { |v| - v.wins34 }
    when "total"
      @api_players = Player.ranked.sort_by { |v| - v.exp34 }
      @api_players = @api_players.sort_by { |v| - ( v.wins34 + v.losses34 + v.draws34 ) }
    when "percentage"
      @api_players = Player.ranked.sort_by { |v| - v.exp34 }
      @api_players = @api_players.sort_by { |v| - ( v.wins34.to_f / [1, v.wins34 + v.losses34 + v.draws34].max ) }
    else
      @api_players = Array.new
    end

    respond_to do |format|
      format.xml
    end
  end

  def authenticate
    logout_keeping_session!
    if @player = Player.authenticate(params[:login], params[:password])
      render :xml => @player.to_xml(:include => :country), :layout => false
    else
      render :nothing => true, :status => :unprocessable_entity
    end
  end

  private
  def activeresource_auth
    player = Player.find(params[:id])
    unless player.activeresource_auth(params[:player][:auth_token])
      render :nothing => true, :status => :unauthorized
      return
    end
  end

end
