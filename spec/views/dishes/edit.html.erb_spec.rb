require 'spec_helper'

describe "dishes/edit" do
  before(:each) do
    @dish = assign(:dish, stub_model(Dish,
      :type => "",
      :title => "MyString",
      :body => "MyString",
      :index => 1
    ))
  end

  it "renders the edit dish form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dish_path(@dish), "post" do
      assert_select "input#dish_type[name=?]", "dish[type]"
      assert_select "input#dish_title[name=?]", "dish[title]"
      assert_select "input#dish_body[name=?]", "dish[body]"
      assert_select "input#dish_index[name=?]", "dish[index]"
    end
  end
end
