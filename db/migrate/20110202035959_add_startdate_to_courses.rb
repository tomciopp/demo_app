class AddStartdateToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :start_date, :string
  end

  def self.down
    remove_column :courses, :start_date
  end
end
