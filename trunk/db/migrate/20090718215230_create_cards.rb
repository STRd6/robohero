class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.string :name, :null => false
      t.integer :dollar_cost, :null => false
      t.integer :energy_cost, :null => false
      t.integer :ready_time, :null => false
      t.string :rules_text, :null => false
      t.string :flavor_text, :null => false

      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :cards
  end
end
