class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.references :game, :null => false
      t.references :account, :null => false
      t.references :robot, :null => false

      t.string :name, :null => false
      t.integer :health, :null => false
      t.integer :armor, :null => false
      t.integer :energy, :null => false
      t.integer :money, :null => false

      t.timestamps :null => false
    end

    add_index :players, :game_id
  end

  def self.down
    drop_table :players
  end
end
