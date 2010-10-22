xml.kifus do
  for k in @kifus
    lines = k.contents.split("\n")
    xml.kifu do
      xml.id(k.id)
      xml.black_name(lines[1])
      xml.white_name(lines[2])
      xml.result(lines[lines.size-2])
      xml.end_time(lines[lines.size-1])
    end
  end
end
