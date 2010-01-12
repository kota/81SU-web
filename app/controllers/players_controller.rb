class PlayersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  before_filter :login_required, :only => [:show,:edit]

  def index
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
  
  # render new.rhtml
  def new
    @player = Player.new
  end
 
  def create
    logout_keeping_session!
    @player = Player.new(params[:player])
    success = @player && @player.save
    if success && @player.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_player = @player # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
