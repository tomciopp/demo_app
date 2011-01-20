class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :content
      t.text :body
      t.integer :user_id

      t.timestamps
    end
    add_index :courses, :user_id
  end

  def self.down
    drop_table :courses
  end
end
