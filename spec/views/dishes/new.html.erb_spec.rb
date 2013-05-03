require 'spec_helper'

describe "dishes/new" do
  before(:each) do
    assign(:dish, stub_model(Dish,
      :type => "",
      :title => "MyString",
      :body => "MyString",
      :index => 1
    ).as_new_record)
  end

  it "renders new dish form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dishes_path, "post" do
      assert_select "input#dish_type[name=?]", "dish[type]"
      assert_select "input#dish_title[name=?]", "dish[title]"
      assert_select "input#dish_body[name=?]", "dish[body]"
      assert_select "input#dish_index[name=?]", "dish[index]"
    end
  end
end
