class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.string :title
      t.integer :theme_id

      t.timestamps
    end
  end
end
