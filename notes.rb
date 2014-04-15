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
