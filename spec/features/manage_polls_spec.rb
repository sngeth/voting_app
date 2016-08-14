require 'rails_helper'

RSpec.feature "Poll management", type: :feature do
  before(:each) do
    visit "/polls/new"

    fill_in "Title", with: "What is your favorite brand?"
    fill_in "poll_choices_attributes_0_name", with: "Coke"
    fill_in "poll_choices_attributes_1_name", with: "Pepsi"
    click_button "Create Poll"
  end

  scenario "User can create and view new poll" do
    expect(page).to have_text("Poll was successfully created.")
    expect(page).to have_content("What is your favorite brand")
    expect(page).to have_content("Coke")
    expect(page).to have_content("Pepsi")
  end

  scenario "Users can vote on polls" do
    visit "/polls/1/take"
    choose 'name_Coke'
    click_button "Vote"
  end
end
