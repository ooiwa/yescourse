require 'spec_helper'

describe "themes/edit" do
  before(:each) do
    @theme = assign(:theme, stub_model(Theme,
      :title => "MyString"
    ))
  end

  it "renders the edit theme form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", theme_path(@theme), "post" do
      assert_select "input#theme_title[name=?]", "theme[title]"
    end
  end
end
