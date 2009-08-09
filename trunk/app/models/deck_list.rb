class DeckList < ActiveRecord::Base
  belongs_to :account

  validates_presence_of :account

  serialize :card_data

  before_validation_on_create :initialize_card_data

  def initialize_card_data
    self.card_data ||= []
  end
end
