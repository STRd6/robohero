class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name, :null => false
      t.boolean :open, :null => false, :default => true

      t.timestamps :null => false
    end

    add_index :games, :open
  end

  def self.down
    drop_table :games
  end
end
