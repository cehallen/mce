$(document).ready(function(){
  $('.word_link').on('click', function(e){
    e.preventDefault();
    // debugger;
    var url = this['href'] + ".json";
    $.get(url, function(data){
      for(var i = 0; i < data.length; i++){
        $('#word_context').append(data[i].content);
      }
    })
  })
});
