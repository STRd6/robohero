class CreateLinkEvents < ActiveRecord::Migration
  def self.up
    create_table :link_events do |t|
      t.references :link, :null => false
      t.string :session_id, :null => false, :limit => 32
      t.string :action, :null => false, :limit => 16

      t.datetime :created_at, :null => false
    end
  end

  def self.down
    drop_table :link_events
  end
end
