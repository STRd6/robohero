class CreateRobots < ActiveRecord::Migration
  def self.up
    create_table :robots do |t|
      t.string :name
      t.int :egen
      t.int :emax
      t.int :armor
      t.int :arm_slots
      t.int :bod_slots
      t.int :misc_slots

      t.timestamps
    end
  end

  def self.down
    drop_table :robots
  end
end
