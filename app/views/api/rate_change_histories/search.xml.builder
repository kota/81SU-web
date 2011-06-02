xml.rate_change_histories do
  for h in @rate_change_histories
    xml.rate_change_history do
      xml.change(h.change)
      xml.sente(h.sente)
      xml.opening(h.opening)
    end
  end
end
