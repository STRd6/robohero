class DeckList < ActiveRecord::Base
  acts_as_versioned

  belongs_to :account

  validates_presence_of :account

  serialize :card_data

  before_validation_on_create :initialize_card_data

  def initialize_card_data
    self.card_data ||= []
  end

  def cards
    Card.find card_data
  end

  def cards=(card_list)
    self.card_data = card_list.map(&:id)
  end
end
