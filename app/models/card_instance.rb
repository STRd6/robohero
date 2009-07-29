class CardInstance < ActiveRecord::Base
  belongs_to :account
  belongs_to :card
end
