xml.ranking(:item => params[:item]) do
  i = 0
  for p in @api_players
    xml.player do
      xml.login(p.login)
      xml.name(p.name)
      xml.country_id(p.country_id)
      xml.exp34(p.exp34)
      xml.wins34(p.wins34)
      xml.losses34(p.losses34)
      xml.draws34(p.draws34)
    end
    i += 1
    break if i >= 100
  end
end
