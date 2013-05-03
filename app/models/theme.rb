class Theme < ActiveRecord::Base
  attr_accessible :title

  def self.default_id
    0
  end
end
