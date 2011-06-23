xml.ranking(:item => params[:item]) do
  i = 0
  for p in @api_players
    xml.player do
      xml.login(p.login)
      xml.name(p.name)
      xml.country_id(p.country_id)
      xml.rate(p.rate.to_i)
      xml.wins(p.wins)
      xml.losses(p.losses)
      xml.streak(p.streak)
      xml.streak_best(p.streak_best)
    end
    i += 1
    break if i >= 100
  end
end
