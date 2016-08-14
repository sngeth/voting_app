require 'rails_helper'

RSpec.describe "polls/index", type: :view do
  before(:each) do
    assign(:polls, [
      Poll.create!(
        :title => "Title"
      ),
      Poll.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of polls" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
