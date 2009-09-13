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

  def join
    object.join(current_account, current_account.deck_lists.first)
    object.save!
    
    redirect_to object
  end

  create.before do
    object.join(current_account, current_account.deck_lists.first)
  end
end
