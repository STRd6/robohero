class FacebookLogin < ActiveRecord::Base
  belongs_to :account

  validates_presence_of :account

  def self.establish_account(fb_user_id)
    transaction do
      login = find_or_initialize_by_fb_user_id(fb_user_id)
      unless login.account
        login.account = Account.create!
      end

      login.save!

      return login.account
    end
  end
end
