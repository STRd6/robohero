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
end
