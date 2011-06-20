class PlayersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  layout 'base'
  before_filter :login_required, :only => [:show,:edit]
  before_filter :localize_if_possible, :only => [:show,:edit,:create]

  def index
    if params[:login].present?
      @player = Player.find_by_login(params[:login])
    end

    respond_to do |format|
      format.html
      format.xml { render :xml => [@player] }
    end
  end
  
  def show
    if(current_player == Player.find_by_id(params[:id]))
      @player = current_player
    else 
      redirect_to('/')
    end
  end

  def edit
    if(current_player == Player.find_by_id(params[:id]))
      @player = current_player
    else 
      redirect_to('/')
    end
  end

  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        if(params[:player][:country_id])
          @player.country = Country.find_by_id(params[:player][:country_id])
        end
        if(params[:player][:pr])
          @player.pr = params[:player][:pr]
        end
        @player.save
        flash[:notice] = 'Player was successfully updated.'
        format.html { redirect_to(@player) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # render new.rhtml
  def new
    @player = Player.new
  end
 
  def create
    logout_keeping_session!
    params[:player][:name] = params[:player][:login]
    @player = Player.new(params[:player])
    @player.country = Country.find_by_id(params[:player][:country_id])
    success = @player && @player.save
    if success && @player.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_player = @player # !! now logged in
      redirect_back_or_default(@player)
      flash[:notice] = "Thanks for signing up!"
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  private
  def localize_if_possible
    country_to_locale = {109 => :ja}
    country_id = params[:player] ? params[:player][:country_id].to_i : current_player && current_player.country ? current_player.country.id : nil
    I18n.locale = country_id && country_to_locale.include?(country_id) ? country_to_locale[country_id] : :en
  end
end
