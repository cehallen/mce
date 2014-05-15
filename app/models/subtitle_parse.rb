class SubtitleParse

  def array_sentences(script)
      script         = script.strip.split(/^\s*$/) 
      context_blocks = []
      script.each do |entry|
        block       = {}

        line        = entry.strip.split("\n")



        number      = check_number(line[0])
        time_marker = check_time_marker(line[1])[0..7]
        content     = check_content(line[2..-1]).join("\n")
        
        block['number']      = number
        block['time_marker'] = time_marker
        block['content']     = content

        context_blocks << block
      end
      context_blocks
    rescue
      return nil
  end

  private

  def check_number(line)
    # /\A\d\z/ =~ line ? true : false
#working here
    if /\A\d\z/ =~ line
      line
    else
      raise 'An error occurred'
    end
  end

  def check_time_marker(line)
    # /-->/ =~ line ? true : false
    if /-->/ =~ line
      line
    else
      raise 'An error occurred'
    end
  end

  def check_content(line)
    # /\S/ =~ line ? true : false  # Make sure something is there at least
    if /\S/ =~ line
      line
    else
      raise 'An error occurred'
    end
  end
end







