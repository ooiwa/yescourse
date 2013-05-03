class Dish < ActiveRecord::Base
  attr_accessible :body, :index, :title, :type

  belongs_to :course
end
