class AddVersioningToDeckLists < ActiveRecord::Migration
  def self.up
    DeckList.create_versioned_table
  end

  def self.down
    DeckList.drop_versioned_table
  end
end
