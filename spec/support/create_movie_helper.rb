require 'spec_helper'

module CreateMovieHelpers
  def create_movie
    click_on 'Add Subtitles'
    fill_in 'Title', with: 'Good Will Hunting'
    attach_file('movie[subtitle_file_url]', 
      File.expand_path('spec/support/goodWillHuntingSHORT.srt'))
    click_on 'Add Movie'
    visit movies_path
  end
end

