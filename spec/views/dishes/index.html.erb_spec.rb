require 'spec_helper'

describe "dishes/index" do
  before(:each) do
    assign(:dishes, [
      stub_model(Dish,
        :type => "Type",
        :title => "Title",
        :body => "Body",
        :index => 1
      ),
      stub_model(Dish,
        :type => "Type",
        :title => "Title",
        :body => "Body",
        :index => 1
      )
    ])
  end

  it "renders a list of dishes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
