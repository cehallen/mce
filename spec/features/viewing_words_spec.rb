require 'spec_helper'

feature 'viewing words for an already submitted movie', %Q{
  As an authenticated or unauthenticated user
  I want to be able to view the words of a movie
  So I can see view them in context
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

  scenario 'as an signed in user' do
    visit movies_path
    #extract to helper
    click_on 'Add a Subtitle File'
    fill_in 'Title', with: 'Good Will Hunting'
    attach_file('movie[script]', 
      File.expand_path('spec/support/goodWillHuntingSHORT.srt'))
    click_on 'Add Movie'

    expect(page).to have_content('you - 21')
    expect(page).to have_content('the - 9')
  end

  scenario '' do
    
  end
end
