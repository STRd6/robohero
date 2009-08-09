class CreateDeckLists < ActiveRecord::Migration
  def self.up
    create_table :deck_lists do |t|
      t.references :account, :null => false
      t.string :name, :null => false
      t.text :card_data, :null => false

      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :deck_lists
  end
end
