require 'spec_helper'

feature 'adding a movie', %Q{
  As an authenticated user
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

  before(:each) do
    sign_in_as(FactoryGirl.create(:user))
  end

  scenario 'with valid srt file' do
    prev_count = Movie.count
    visit movies_path
    click_on 'Add a Subtitle File'

    fill_in 'Title', with: 'Good Will Hunting'
    attach_file('movie[script]', 
      File.expand_path('spec/support/goodWillHuntingSHORT.srt'))
    click_on 'Add Movie'

    expect(page).to have_content('Your movie is ready!')
    expect(page).to have_content('High Frequency Words')
    expect(page).to have_content('Medium Frequency Words')
    expect(page).to have_content('Low Frequency Words')
    expect(Movie.count).to eq(prev_count + 1)
    #expect containers for hi/med/lo to not be empty
  end

  scenario 'with invalid attributes' do
    prev_count = Movie.count
    visit movies_path
    click_on 'Add a Subtitle File'

    click_on 'Add Movie'

    expect(page).to have_content('Please input both items')
    expect(page).to_not have_content('Your movie is ready!')
    expect(page).to have_content()
  end
end
