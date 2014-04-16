require 'spec_helper'

feature 'viewing sentences for an already submitted movie', %Q{
  As an authenticated or unauthenticated user
  I want to be able to view the sentences of a movie
  So I can see view the words in their context
} do

# Acceptance Criteria:

# * On a movie's show page, I can click a word and
#   be shown a list of sentences where that word occurs 
#   in the movie, and see the sentences surrounding it

  scenario 'as authenticated user' do
    sign_in_as(FactoryGirl.create(:user))
    visit movies_path
    create_movie
    click_on 'Good Will Hunting'
    click_on 'know'

    expect(page).to have_content("
      I know many of you had this as undergraduates, 
      but it won't hurt to brush up.")
    expect(page).to have_content('know')
  end

  scenario 'as unauthenticated user' do
    sign_in_as(FactoryGirl.create(:user))
    visit movies_path
    create_movie
    click_on 'Sign Out'
    visit movies_path
    click_on 'Good Will Hunting'
    click_on 'know'

    expect(page).to have_content("
      I know many of you had this as undergraduates, 
      but it won't hurt to brush up.")
    expect(page).to have_content('know')
  end
end
