class SubtitleParse

  def array_sentences(script)
    script         = script.strip.split(/^\s*$/) 
    context_blocks = []
    script.each do |entry|
      block       = {}
      line        = entry.strip.split("\n")
      number      = line[0]
      time_marker = line[1][0..7]
      content     = line[2..-1].join("\n")

      
      block['number']      = number
      block['time_marker'] = time_marker
      block['content']     = content

      context_blocks << block
    end
    context_blocks
  end
end
