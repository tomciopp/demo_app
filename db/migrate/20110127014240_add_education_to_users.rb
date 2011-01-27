class AddEducationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :education, :string
  end

  def self.down
    remove_column :users, :education
  end
end
