class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :account
  belongs_to :robot
  
  before_validation_on_create :setup_player

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
    GameCard.in_hand(self.id)
  end

  def cards_in_deck
    GameCard.in_deck(self.id)
  end

  def cards_in_discard
    GameCard.in_discard(self.id)
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
