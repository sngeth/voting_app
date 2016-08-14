require 'rails_helper'

RSpec.describe "polls/edit", type: :view do
  before(:each) do
    @poll = assign(:poll, Poll.create!(
      :title => "MyString"
    ))
  end

  it "renders the edit poll form" do
    render

    assert_select "form[action=?][method=?]", poll_path(@poll), "post" do

      assert_select "input#poll_title[name=?]", "poll[title]"
    end
  end
end
