class AddHealthToRobot < ActiveRecord::Migration
  def self.up
    add_column :robots, :health, :integer
  end

  def self.down
    remove_column :robots, :health
  end
end
