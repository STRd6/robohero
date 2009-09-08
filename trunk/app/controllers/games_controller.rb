class GamesController < ResourceController::Base
  include FacebookController
  actions :all, :except => :destroy

  def discard
    object.discard(GameCard.find(params[:target_id]))
    render :ok
  end
end
