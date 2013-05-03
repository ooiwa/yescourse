class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id, :null => false
      t.string :title
      t.integer :theme_id, :null => false

      t.timestamps
    end

    add_index :courses, :user_id, :unique => true

  end
end
