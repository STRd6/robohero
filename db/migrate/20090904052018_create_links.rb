class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.references :account, :null => false
      t.references :target, :polymorphic => true
      t.string :token, :null => false, :limit => 32
      t.string :channel, :null => false, :limit => 16

      t.datetime :created_at, :null => false
    end

    add_index :links, :token, :unique => true
  end

  def self.down
    drop_table :links
  end
end
