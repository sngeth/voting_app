require 'rails_helper'

RSpec.feature "Poll management", type: :feature do
  scenario "User creates a new poll" do
    visit "/polls/new"

    fill_in "Title", with: "What is your favorite brand?"
    fill_in "poll_choices_attributes_0_name", with: "Coke"
    fill_in "poll_choices_attributes_1_name", with: "Pepsi"
    click_button "Create Poll"

    expect(page).to have_text("Poll was successfully created.")
  end
end
