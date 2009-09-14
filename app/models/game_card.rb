class GameCard < ActiveRecord::Base
  include RandomScope

  belongs_to :location, :polymorphic => true
  belongs_to :card

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

  delegate :name,
    :rules_text,
    :flavor_text,
    :money_cost,
    :energy_cost,
    :to => :card
end
