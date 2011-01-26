class AddLocationToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :location, :string
  end

  def self.down
    remove_column :courses, :location
  end
end
