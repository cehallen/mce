require 'spec_helper'

feature 'adding a movie', %Q{
  As a ___ user
  I want to be able to upload srt files
  So I can study movies of my choosing
} do

# Acceptance Criteria:

# * On the movies index page I can find a link to upload my own movie
# * On the movie creation page I see an upload srt file option
# * If the file I upload is not an srt or txt file I get an error message
#   and am prompted to try again
# * While uploading I'm given an uploading confirmation and/or status ()
# * If unsuccessful I'm given errors and can try again
# * If successfully uploaded I'm given a notice and taken to that
#   movie's page
# * The movie page contains a title, number of unique, non-trivial
#   words added, and three categories of words by frequency: hi/med/lo

  scenario 'with valid srt file' do
    visit movies_path
    click_on 'Upload a new subtitle file'
    attach_file 'Choose File', '/Users/mooncake/Dropbox/launchacademy/breakabletoy/goodWillHunting.srt'
    # attach_file('Image', '/path/to/image.jpg')
    expect(page).to have_content('Your movie is ready!')
    expect(page).to have_content('High Frequency')
    expect(page).to have_content('Medium Frequency')
    expect(page).to have_content('Low Frequency')
    #expect containers for hi/med/lo to not be empty
  end

  scenario 'with invalid srt file'
end
