%Q{
  -From old movie show page with all the sentences:
  <p>
    <% @movie.sentences.each do |sentence| %>
      <p><%= link_to sentence.content, sentence_path(sentence) %></p>
    <% end %>
  </p>


}

# new movies#show in controller
def show
  # @movie = Movie.find(params[:id])
  # @sentences = @movie.sentences

  @movie = Movie.find(params[:id])
  @words_lo = Word.where("frequency = 1")
  @words_med = Word.where("frequency > 1 AND <= 5")
  @words_hi = Word.where("frequency > 5")

end
