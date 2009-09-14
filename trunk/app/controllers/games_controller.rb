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

  def played
    player = object.players.find_by_account_id(current_account.id)
    game_card = player.cards_in_hand.find(params[:target_id])
    
    player.deploy(game_card, params[:slot_type], params[:position])
  end

  create.before do
    object.join(current_account, current_account.deck_lists.first)
  end
end
