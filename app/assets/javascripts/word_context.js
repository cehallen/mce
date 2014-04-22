// missing title word and link to google search

$(document).ready(function(){
  $('.word_link').on('click', function(e){
    e.preventDefault();
    $('.word_context').empty();
    // var $word_li = this; // failed to get this variable passable in for loop below.  You want to have the sentences append to 'this'rather than a column on the right
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
        
        $('.word_context').append($context_block)

      }
    })
  })
});
// $('.word_context').append(data[i].content);
// Create the HTML/DOM element for the new comment
      //   var $commentAuthor = $('<h4>').text(response.author);
      //   var $commentBody = $('<p>').text(response.body);
      //   var $comment = $('<div>')
      //     .addClass('comment')
      //     .append($commentAuthor)
      //     .append($commentBody);

      //   // Add the new comment to the comment feed
      //   var $commentFeed = $('.comment-feed');
      //   $commentFeed.append($comment);
      // },
