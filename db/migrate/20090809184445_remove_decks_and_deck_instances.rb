class RemoveDecksAndDeckInstances < ActiveRecord::Migration
  def self.up
    drop_table :deck_instances
    drop_table :decks
  end

  def self.down
    create_table :decks do |t|
      t.string :name
      t.integer :size

      t.timestamps
    end

    create_table :deck_instances do |t|
      t.references :deck

      t.timestamps
    end
  end
end
