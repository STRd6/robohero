class CreateDeckInstances < ActiveRecord::Migration
  def self.up
    create_table :deck_instances do |t|
      t.references :deck

      t.timestamps
    end
  end

  def self.down
    drop_table :deck_instances
  end
end
