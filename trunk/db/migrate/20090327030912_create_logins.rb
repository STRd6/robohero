class CreateLogins < ActiveRecord::Migration
  def self.up
    create_table :open_id_logins do |t|
      t.references :account, :null => false
      t.string :identity_url, :null => false

      t.timestamps :null => false
    end

    add_index :open_id_logins, :identity_url, :unique => true
  end

  def self.down
    drop_table :open_id_logins
  end
end
