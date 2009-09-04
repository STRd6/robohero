class Link < ActiveRecord::Base
  belongs_to :account
  belongs_to :target, :polymorphic => true
  
  before_validation_on_create :make_token

  def url
    "http://game.robohero.com/q/#{token}"
  end

  private

  def make_token
    self.token = ActiveSupport::SecureRandom.hex(16)
  end
end
