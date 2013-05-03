class Course < ActiveRecord::Base
  attr_accessible :theme_id, :title, :user_id

  has_one :user
  has_many :dishes
  belongs_to :theme

  def has_no_theme?
    theme_id == Theme.default_id
  end

  def update_theme(t)

    self.theme_id = t.id

    self.transaction do

      self.dishes.each do |d|
        d.destroy
      end

      t.categories.each_with_index do |category, i|
        dish = self.dishes.build
        dish.category = category
        dish.index = i
        dish.title = ""
        dish.save!
      end

      self.save!
    end
  end

  def completed?
    complete = true
    self.dishes.each do |d|
      if d.title == ""
        complete = false
      end
    end
    return complete
  end
end
