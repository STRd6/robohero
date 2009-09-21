class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :account
  belongs_to :robot
  
  before_validation_on_create :setup_player

  validates_numericality_of :armor
  validates_numericality_of :egen, :greater_than_or_equal_to => 0
  validates_numericality_of :energy, :greater_than_or_equal_to => 0
  validates_numericality_of :money, :greater_than_or_equal_to => 0
  validates_numericality_of :body_slots, :greater_than_or_equal_to => 0
  validates_numericality_of :arm_slots, :greater_than_or_equal_to => 0
  validates_numericality_of :misc_slots, :greater_than_or_equal_to => 0

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

  def equipped_cards
    GameCard.equipped(id)
  end

  def deploy(game_card, slot_type, slot_id)
    transaction do
      self.money -= game_card.money_cost
      self.energy -= game_card.energy_cost

      game_card.update_attributes!(
        :location_type => "#{slot_type}",
        :location_id => id,
        :position => slot_id
      )
      save!
    end
  end

  def do_upkeep(income)
    draw 1
    self.money += income
    self.energy += egen
    save!
  end

  def receive_damage(damage_array)
    total = 0;
    damage_array.each do |type, amount|
      total += amount
    end

    net_damage = [0, total - armor].max

    self.health -= net_damage

    save!
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
    self.egen = robot.egen
    self.money = 2
    self.energy = 0
  end
end
