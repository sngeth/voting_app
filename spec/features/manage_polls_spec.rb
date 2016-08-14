require 'rails_helper'

RSpec.feature "Poll management", type: :feature do
  scenario "User creates a new poll" do
    visit "/polls/new"

    fill_in "Title", with: "My Test Poll"
    click_button "Create Poll"

    expect(page).to have_text("Poll was successfully created.")
  end
end
