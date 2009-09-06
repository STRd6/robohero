class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :account

  def shuffle_deck
    
  end

  def draw(amount)
    
  end

  def cards_in_hand
    GameCard.in_hand(self.id)
  end

  def cards_in_deck
    GameCard.in_deck(self.id)
  end

  def cards_in_discard
    GameCard.in_deck(self.id)
  end
end
