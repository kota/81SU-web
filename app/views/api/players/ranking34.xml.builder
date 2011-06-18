xml.ranking(:item => params[:item]) do
  nowDate = Date.strptime(DateTime.now.utc.strftime("%Y-%m-%d"))
  i = 0
  for p in @api_players
    next if (p.wins34 + p.losses34 + p.draws34 < 5)
    xml.player do
      xml.login(p.login)
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
