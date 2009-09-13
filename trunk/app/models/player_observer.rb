class PlayerObserver < ActiveRecord::Observer
  def after_create(player)
    player.create_deck
  end


end
