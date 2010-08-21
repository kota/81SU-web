class PlayersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  layout 'base'
  before_filter :login_required, :only => [:show,:edit]

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
      puts "redirecting to /"
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
    if @player
      @player.update_attributes(params[:player])
    end
    respond_to do |format|
      format.html {render :action => :index}
      format.xml {render :xml => @player}
    end
  end

  # render new.rhtml
  def new
    @player = Player.new
  end
 
  def create
    logout_keeping_session!
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
end
