class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :course_id, :null => false
      t.string :category
      t.string :title, :null => false
      t.string :body
      t.integer :index, :null => false

      t.timestamps
    end

    add_index :dishes, :course_id, :unique => false

  end
end
