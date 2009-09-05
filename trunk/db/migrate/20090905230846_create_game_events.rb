class CreateGameEvents < ActiveRecord::Migration
  def self.up
    create_table :game_events do |t|
      t.references :game, :null => false
      t.integer :stack_depth, :null => false
      t.integer :player, :null => false
      t.references :datum, :polymorphic => true, :null => false


      t.timestamps :null => false
    end

    add_index :game_events, :game_id
  end

  def self.down
    drop_table :game_events
  end
end
