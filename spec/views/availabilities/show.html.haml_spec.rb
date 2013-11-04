require 'spec_helper'

describe "availabilities/show" do
  before(:each) do
    @availability = assign(:availability, stub_model(Availability))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
