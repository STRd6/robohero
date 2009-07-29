class CreateCardInstances < ActiveRecord::Migration
  def self.up
    create_table :card_instances do |t|
      t.references :account, :null => false
      t.references :card, :null => false

      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :card_instances
  end
end
