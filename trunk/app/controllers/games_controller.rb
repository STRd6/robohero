class GamesController < ResourceController::Base
  include FacebookController
  actions :all, :except => :destroy

  def discard
    object.discard(GameCard.find(params[:target_id]))
    render :ok
  end

  def draw
    object.players.find(params[:target_id]).draw(1)
  end
end
