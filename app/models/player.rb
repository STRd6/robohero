class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :account

  def shuffle_deck
    
  end

  def draw(amount)
    
  end
end
