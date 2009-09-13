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

  def join(account, deck_list)
    unless object.players.map(&:account_id).include? account.id
      player = players.build(:game => self, :account => account, :robot => Robot.first)
      player.deck_list = deck_list
    end
  end
end
