xml.kifus do
  for k in @kifus
    lines = k.contents.split("\n")
    xml.kifu do
      xml.id(k.id)
      xml.game_id(lines[4])
      xml.result(lines[lines.size-2])
      xml.end_time(lines[lines.size-1])
    end
  end
end
