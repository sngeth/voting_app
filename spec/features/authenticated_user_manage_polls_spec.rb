require 'rails_helper'

RSpec.feature "Poll management", type: :feature do
  fixtures :users

  scenario "Unauthenicated user cannot create poll" do
    visit "/polls/new"
    expect(current_path).to eq "/users/sign_in"
  end

  scenario "Only authenticated user can create polls" do
    sign_in users(:one)
    visit "/polls/new"
    fill_in "Title", with: "What is your favorite brand?"
    fill_in "poll_choices_attributes_0_name", with: "Coke"
    fill_in "poll_choices_attributes_1_name", with: "Pepsi"
    click_button "Create Poll"

    expect(page).to have_text("Poll was successfully created.")
    expect(page).to have_content("What is your favorite brand")
    expect(page).to have_content("Coke")
    expect(page).to have_content("Pepsi")
    expect(page).to have_selector(:link_or_button, 'Link To Take Poll')
  end
end
