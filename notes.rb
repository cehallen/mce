%Q{
  -Check out aggregate queries in SQL (for purpose of listing words by frequency in that movie, not using frequency)and get rid of frequency column
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

# old way of hi/med/lo freq in movies show
<% @words_hi.each do |word| %>
  <li><%= link_to word.content, word_path(word) %> - <%= word.frequency %></li>
<% end %>

<h5>Medium Frequency Words</h5>
<% @words_med.each do |word| %>
  <li><%= link_to word.content, word_path(word) %> - <%= word.frequency %></li>
<% end %>

<h5>Low Frequency Words</h5>
<% @words_lo.each do |word| %>
  <li><%= link_to word.content, word_path(word) %> - <%= word.frequency %></li>
<% end %>
