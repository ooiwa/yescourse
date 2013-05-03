class Course < ActiveRecord::Base
  attr_accessible :theme_id, :title, :user_id

  has_one :user
  has_many :dishes
  has_one :theme
end
