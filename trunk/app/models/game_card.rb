class GameCard < ActiveRecord::Base
  include RandomScope

  belongs_to :location, :polymorphic => true
  belongs_to :card

  validates_numericality_of :cooldown_counters, :greater_than_or_equal_to => 0

  named_scope :in_hand, lambda {|player_id| {:conditions => {:location_id => player_id, :location_type => "Hand"}}}
  named_scope :in_deck, lambda {|player_id| {:conditions => {:location_id => player_id, :location_type => "Deck"}}}
  named_scope :in_discard, lambda {|player_id| {:conditions => {:location_id => player_id, :location_type => "Discard"}}}
  named_scope :in_slot, lambda {|player_id, slot_type, position|
    {:conditions => {
      :location_id => player_id,
      :location_type => slot_type,
      :position => position,
    }}
  }

  named_scope :equipped, lambda {|player_id|
    {:conditions => {
      :location_id => player_id,
      :location_type => Robot::SLOT_TYPES,
    }}
  }

  delegate :name,
    :rules_text,
    :attacks,
    :activated_abilities,
    :flavor_text,
    :money_cost,
    :energy_cost,
    :to => :card

  def attack
    transaction do
      if cooldown_counters == 0
        selected_attack = attacks.first
        if selected_attack
          self.cooldown_counters += selected_attack.cost_array.first.last
          save!
          return selected_attack.damage_array
        end
      end

      return []
    end
  end

  def upkeep
    self.cooldown_counters = [cooldown_counters - 1, 0].max
    save!
  end
end
