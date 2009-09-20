class CreateGameCards < ActiveRecord::Migration
  def self.up
    create_table :game_cards do |t|
      t.references :location, :null => false, :polymorphic => true
      t.integer :position, :null => false, :default => 0
      t.references :card, :null => false
      t.integer :cooldown_counters, :null => false, :default => 0

      t.timestamps :null => false
    end

    add_index :game_cards, [:location_id, :location_type]
  end

  def self.down
    drop_table :game_cards
  end
end
