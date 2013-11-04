require 'spec_helper'

describe "availabilities/edit" do
  before(:each) do
    @availability = assign(:availability, stub_model(Availability))
  end

  it "renders the edit availability form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", availability_path(@availability), "post" do
    end
  end
end
