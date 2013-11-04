require 'spec_helper'

describe "availabilities/index" do
  before(:each) do
    assign(:availabilities, [
      stub_model(Availability),
      stub_model(Availability)
    ])
  end

  it "renders a list of availabilities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
