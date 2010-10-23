xml.players do
  for p in @api_players
    xml.player do
      xml.id(p.id)
      xml.login(p.login)
      xml.country_id(p.country_id)
      xml.rate(p.rate)
      xml.wins(p.wins)
      xml.losses(p.losses)
      xml.streak(p.streak)
      xml.streak_best(p.streak_best)
      xml.created_at(p.created_at)
      xml.updated_at(p.updated_at)
    end
  end
end
