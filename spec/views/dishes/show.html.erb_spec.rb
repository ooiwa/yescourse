require 'spec_helper'

describe "dishes/show" do
  before(:each) do
    @dish = assign(:dish, stub_model(Dish,
      :type => "Type",
      :title => "Title",
      :body => "Body",
      :index => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    rendered.should match(/Title/)
    rendered.should match(/Body/)
    rendered.should match(/1/)
  end
end
