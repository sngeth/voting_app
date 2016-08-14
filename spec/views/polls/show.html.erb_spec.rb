require 'rails_helper'

RSpec.describe "polls/show", type: :view do
  before(:each) do
    @poll = assign(:poll, Poll.create!(
      :title => "Title"
    ))

    @poll.choices.create(name: "Choice 1")
    @poll.choices.create(name: "Choice 2")
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
