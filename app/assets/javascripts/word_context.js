$(document).ready(function(){
  $('.word_link').on('click', function(e){
    e.preventDefault();
    $('.word_context').empty();
    var url = this['href'] + ".json";
    $.get(url, function(data){

      for(var i = 0; i < data.sentences.length; i++){
        
        var $time = $('<p>').text("@" + data.sentences[i].time_marker);
        var $previous = $('<p>').text(data.sentences[i].previous);
        var $content = $('<p>').text(data.sentences[i].content).css('font-weight', 'bold');
        var $following = $('<p>').text(data.sentences[i].following);
        var $context_block = $('<div>')
          .addClass('context_block')
          .append($time)
          .append($previous)
          .append($content)
          .append($following);
        
        $('.word_context').append($context_block)

      }

      // prepend the word and link to google
      var $word_link_div = $('<div>').addClass('word_link_div');
      $word_link_div.append($('<a>',{
        text: data.word,
        href: "http://www.google.com/search?q=" + data.word
      }));
      $('.word_context').prepend($word_link_div);
    });
  });
});
