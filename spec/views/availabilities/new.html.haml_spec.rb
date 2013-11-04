require 'spec_helper'

describe "availabilities/new" do
  before(:each) do
    assign(:availability, stub_model(Availability).as_new_record)
  end

  it "renders new availability form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", availabilities_path, "post" do
    end
  end
end
