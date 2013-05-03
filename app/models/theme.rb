# -*- coding: utf-8 -*-
class Theme < ActiveRecord::Base
  attr_accessible :title, :cover, :categories, :cover_file_name
  has_attached_file :cover, :styles => {
    :medium => "300x300>", :thumb => "100x100>",
    :full => "650x939>"
  }, :default_url => "/images/:style/missing.png"

  has_many :courses

  after_initialize :init

  def init
    self.categories ||= "オードブル,スープ,魚料理,肉料理,メインディッシュ,サラダ,デザート,ドリンク"
  end

  def self.default_id
    0
  end

  def categories
    str = super()
    if not str.nil?
      return str.split(',')
    else
      nil
    end
  end

  def css_class_name
    "theme_" + self.title
  end
end
