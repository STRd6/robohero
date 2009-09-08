class Game < ActiveRecord::Base
  has_many :players
  has_many :game_events
  belongs_to :current_event

  def start
    # Each player shuffles deck and draws 7 cards
    players.each do |player|
      player.shuffle_deck
      player.draw 7
    end
  end

  def discard(game_card)
    game_card.location_type = "Discard"
    game_card.save!
  end
end
