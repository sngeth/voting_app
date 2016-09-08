require 'rails_helper'

RSpec.feature "Poll management", type: :feature do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/polls/new"

    fill_in "Title", with: "What is your favorite brand?"
    fill_in "poll_choices_attributes_0_name", with: "Coke"
    fill_in "poll_choices_attributes_1_name", with: "Pepsi"
    click_button "Create Poll"
  end

  scenario "User can create then view/share new poll" do
    expect(page).to have_text("Poll was successfully created.")
    expect(page).to have_content("What is your favorite brand")
    expect(page).to have_content("Coke")
    expect(page).to have_content("Pepsi")
    expect(page).to have_selector(:link_or_button, 'Link To Take Poll')
  end

  scenario "Users can vote on polls" do
    visit "/polls/1/take"
    choose 'name_Coke'
    click_button "Vote"

    expect(current_path).to eq results_poll_path(id: 1)
    expect(page).to have_content("Coke: 1")
  end
end
