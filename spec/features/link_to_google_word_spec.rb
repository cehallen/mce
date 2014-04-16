require 'spec_helper'

feature 'linking to a Google search of that word', %Q{
  As an authenticated or unauthenticated user
  I want to be able to easily initiate a google search of the word
  So I can gain more context and definitions
} do

# Acceptance Criteria:

# * On a movie's, word's, sentences show page, 
#   I can click a word and be linked to Google search

  scenario 'as authenticated user' do
    sign_in_as(FactoryGirl.create(:user))
    visit movies_path
    create_movie
    click_on 'Good Will Hunting'
    click_on 'astrophysicists'
    within(:css, 'h3') do
      expect(page).to have_css('a[href="http://www.google.com/search?q=astrophysicists"]')
    end
  end
end
