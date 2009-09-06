class CreateGameCards < ActiveRecord::Migration
  def self.up
    create_table :game_cards do |t|
      t.references :location, :null => false, :polymorphic => true
      t.references :card, :null => false

      t.timestamps :null => false
    end

    add_index :game_cards, [:location_id, :location_type]
  end

  def self.down
    drop_table :game_cards
  end
end
