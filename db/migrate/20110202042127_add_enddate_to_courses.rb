class AddEnddateToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :end_date, :string
  end

  def self.down
    remove_column :courses, :end_date
  end
end
