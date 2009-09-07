class CreateRobots < ActiveRecord::Migration
  def self.up
    create_table :robots do |t|
      t.string :name, :null => false
      t.integer :egen, :null => false, :default => 2
      t.integer :energy_max, :null => false, :default => 6
      t.integer :health_max, :null => false, :default => 30
      t.integer :armor, :null => false, :default => 0
      t.integer :arm_slots, :null => false, :default => 0
      t.integer :bod_slots, :null => false, :default => 0
      t.integer :misc_slots, :null => false, :default => 0

      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :robots
  end
end
