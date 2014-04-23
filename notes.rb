%Q{
  -Finish the app, eg tests, holes in database and wonky associations on deletion are BAD.

  -Json buildier -> vanilla json worked to add 'word' link
  -Some words don't work, like 'me' in GWH short
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

  -Deleting a duplicate movie deletes all words for the original.

}
# from adam's
$(document).ready(function(){
  $('.word_link').on('click', function(e){
    e.preventDefault();
    // debugger;
    var url = this['href'] + ".json";
    $.get(url, function(data){
      for(var i = 0; i < data.length; i++){
        $('.word_context').append(data[i].content);
      }
    })
  })
});



 // missing title word and link to google search
#minimally screwed up
$(document).ready(function(){
  $('.word_link').on('click', function(e){
    e.preventDefault();
    var word_context = $('<div>').addClass('word_context')
    this.append(word_context)
    // $('.word_context').empty();

    var word_li = this
    debugger;
    var url = this['href'] + ".json";
    $.get(url, function(data){
      for(var i = 0; i < data.length; i++){
        var $time = $('<p>').text("@" + data[i].time_marker);
        var $previous = $('<p>').text(data[i].previous);
        var $content = $('<p>').text(data[i].content).css('font-weight', 'bold');
        var $following = $('<p>').text(data[i].following);
        var $context_block = $('<div>')
          .addClass('context_block')
          .append($time)
          .append($previous)
          .append($content)
          .append($following);
        // console.log(word_li);
        $(word_li).append($context_block);

      }
    })
  })
});






















