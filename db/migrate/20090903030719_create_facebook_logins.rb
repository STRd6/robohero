class CreateFacebookLogins < ActiveRecord::Migration
  def self.up
    create_table :facebook_logins do |t|
      t.references :account
      t.integer :fb_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :facebook_logins
  end
end
