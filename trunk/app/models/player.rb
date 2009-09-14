class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :account
  belongs_to :robot
  
  before_validation_on_create :setup_player

  attr_accessor :deck_list

  def shuffle_deck
    
  end

  def draw(amount)
    transaction do
      cards_in_deck.random(amount).each do |card|
        card.location_type = "Hand"
        card.save!
      end
    end
  end

  def cards_in_hand
    GameCard.in_hand(id)
  end

  def cards_in_deck
    GameCard.in_deck(id)
  end

  def cards_in_discard
    GameCard.in_discard(id)
  end

  def card_in_slot(slot_type, position)
    GameCard.in_slot(id, slot_type, position)
  end

  def deploy(game_card, slot_type, slot_id)
    #TODO: Pay for card

    game_card.update_attributes!(
      :location_type => "#{slot_type}",
      :location_id => id,
      :position => slot_id
    )
  end
  
  def create_deck
    deck_list.cards.each do |card|
      GameCard.create!(:card => card, :location_type => "Deck", :location_id => id)
    end if deck_list
  end

  private

  def setup_player
    self.name ||= account.nickname || "Gueast"

    self.body_slots = robot.body_slots
    self.arm_slots = robot.arm_slots
    self.misc_slots = robot.misc_slots

    self.health = robot.health_max
    self.armor = robot.armor
    self.money = 2
    self.energy = 0
  end
end
