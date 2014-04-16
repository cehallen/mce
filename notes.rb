%Q{
  -Check out aggregate queries in SQL (for purpose of listing words by frequency in that movie, not using frequency)and get rid of frequency column
    • @sentences = @movie.sentences
        .joins(:sjoinws).where(sjoinws: { word: @word })
    • select words.content, count(*) from movies join sentences on movies.id = sentences.movie_id join sjoinws on sjoinws.sentence_id = sentences.id join words on words.id = sjoinws.word_id where movies.id = 2 group by words.content order by count(*) desc;

  -Currently doesn't account for movies with <i> italics tag in subtitles.  Breaks the app.

  -Therefore, must make an error message for unsupported format and formatting (and provide a sample of format which works)

  -Error with word show page, comes on clicking first word in GWH.  
    • <% if number == 1 %>
        <% previous_sentence = nil %>
      <% else %>
        <% previous_sentence = 
          Sentence.where("number = #{number - 1} 
          AND movie_id = #{sentence.movie_id}").take.content %>
      <% end %>

  -Would love to be able to google the word by clicking on it in the show
    • <%= link_to @word.content, 
    "http://www.google.com/search?q=#{@word.content}" %>

}

