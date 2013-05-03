class Dish < ActiveRecord::Base
  attr_accessible :course_id, :body, :index, :title, :category

  belongs_to :course

  def css_class_name
    "dish_" + index.to_s
  end
end
