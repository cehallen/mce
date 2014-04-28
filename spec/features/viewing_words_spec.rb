require 'spec_helper'

feature 'viewing words for an already submitted movie', %Q{
  As an authenticated or unauthenticated user
  I want to be able to view the words of a movie
  So I can see a summary and frequency of words
} do

# Acceptance Criteria:

# * On the movies index page I can click on a movie's title 
#   and be shown a list of words from the movie and frequency

# # Use of synchronize.  official way jniklas way.
# page.document.synchronize do
#   element = first('#whatever')
#   if element
#     element.click
#     find('#foo').text
#   else
#     nil
#   end
# end

  scenario 'as authenticated user' do
    sign_in_as(FactoryGirl.create(:user))
    visit movies_path
    create_movie  # CreateMovieHelper
    click_on 'Good Will Hunting'
    # save_and_open_page
    # visit movies_path
    # wait_for_words  # CapybaraHelpers

    # using_wait_time 9 do
    #   expect(page).to have_content('you - 21')
    #   expect(page).to have_content('the - 9')
    # end
    save_and_open_page
    expect(page).to have_content('you')
    # expect(page).to have_content('the - 9')
  end

  # scenario 'as unauthenticated user' do
  #   sign_in_as(FactoryGirl.create(:user))
  #   visit movies_path
  #   create_movie
  #   click_on 'Sign Out'
  #   visit movies_path
  #   click_on 'Good Will Hunting'

  #   expect(page).to have_content('you')
  # end
end
