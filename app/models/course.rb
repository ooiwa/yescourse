class Course < ActiveRecord::Base
  attr_accessible :theme_id, :title, :user_id
end
