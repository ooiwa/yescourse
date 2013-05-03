require 'spec_helper'

describe "courses/edit" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :user_id => 1,
      :title => "MyString",
      :theme_id => 1
    ))
  end

  it "renders the edit course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", course_path(@course), "post" do
      assert_select "input#course_user_id[name=?]", "course[user_id]"
      assert_select "input#course_title[name=?]", "course[title]"
      assert_select "input#course_theme_id[name=?]", "course[theme_id]"
    end
  end
end
