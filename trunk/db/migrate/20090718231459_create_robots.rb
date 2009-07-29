class CreateRobots < ActiveRecord::Migration
  def self.up
    create_table :robots do |t|
      t.string :name
      t.integer :egen
      t.integer :emax
      t.integer :armor
      t.integer :arm_slots
      t.integer :bod_slots
      t.integer :misc_slots

      t.timestamps
    end
  end

  def self.down
    drop_table :robots
  end
end
