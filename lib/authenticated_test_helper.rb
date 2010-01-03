module AuthenticatedTestHelper
  # Sets the current player in the session from the player fixtures.
  def login_as(player)
    @request.session[:player_id] = player ? (player.is_a?(Player) ? player.id : players(player).id) : nil
  end

  def authorize_as(player)
    @request.env["HTTP_AUTHORIZATION"] = player ? ActionController::HttpAuthentication::Basic.encode_credentials(players(player).login, 'monkey') : nil
  end
  
end
