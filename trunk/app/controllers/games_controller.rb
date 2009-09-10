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
    unless object.players.map(&:account_id).include? current_account.id
      #TODO: Refactor and load deck list
      object.players << [Player.new(:game => object, :account => current_account, :robot => Robot.first)]
    end

    redirect_to object
  end

  create.before do
    #TODO: Refactor and load deck list
    object.players = [Player.new(:game => object, :account => current_account, :robot => Robot.first)]
  end
end
