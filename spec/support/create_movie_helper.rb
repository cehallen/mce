require 'spec_helper'

module CreateMovieHelpers
  def create_movie
    click_on 'Add a Subtitle File'
    fill_in 'Title', with: 'Good Will Hunting'
    attach_file('movie[script]', 
      File.expand_path('spec/support/goodWillHuntingSHORT.srt'))
    click_on 'Add Movie'
    visit movies_path
  end
end

