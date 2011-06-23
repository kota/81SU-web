xml.players do
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
      xml.exp34(p.exp34)
      xml.wins34(p.wins34)
      xml.losses34(p.losses34)
      xml.draws34(p.draws34)
      xml.created_at(p.created_at)
      xml.updated_at(p.updated_at)
    end
  end
end
