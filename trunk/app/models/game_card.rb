class GameCard < ActiveRecord::Base
  include RandomScope

  belongs_to :location, :polymorphic => true
  belongs_to :card

  named_scope :in_hand, lambda {|player_id| {:conditions => {:location_id => player_id, :location_type => "Hand"}}}
  named_scope :in_deck, lambda {|player_id| {:conditions => {:location_id => player_id, :location_type => "Deck"}}}
  named_scope :in_discard, lambda {|player_id| {:conditions => {:location_id => player_id, :location_type => "Discard"}}}

  delegate :name, :rules_text, :flavor_text, :to => :card
end
