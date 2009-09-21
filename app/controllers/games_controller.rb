class GamesController < ResourceController::Base
  include FacebookController
  actions :all, :except => [:update, :destroy]

  before_filter :login_required, :ensure_deck_list, :except => [:show, :index]

  before_filter :ensure_priority, :except => [:new, :join, :create, :show, :index, :start]
  before_filter :ensure_main_phase, :only => :played

  helper_method :is_priority_player?

  def start
    object.begin_game
    object.save!
    redirect_to object
  end

  def discard
    #TODO: verify phase
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
    #TODO: verify phase
    game_card = requesting_player.cards_in_hand.find(params[:target_id])
    
    requesting_player.deploy(game_card, params[:slot_type], params[:position])
  end

  def pass_priority
    object.pass_priority
    object.save!
    redirect_to object
  end

  def attack
    #TODO: verify phase
    player = object.players.find_by_account_id(current_account.id)

    #TODO: Select from params
    attacking_cards = player.equipped_cards

    damage_array = attacking_cards.inject([]) do |array, card|
      array += card.attack
    end

    render :text => damage_array
  end

  create.before do
    object.join(current_account, current_account.deck_lists.first)
  end

  private
  def requesting_player
    object.players.find_by_account_id(current_account.id)
  end

  def ensure_main_phase
    unless object.first_main_phase? || object.second_main_phase?
      flash[:error] = "Not in main phase!"
      redirect_to object
    end
  end

  def ensure_priority
    unless is_priority_player?
      flash[:error] = "You do not have priority!"
      redirect_to object
    end
  end

  def is_priority_player?
    object.priority_player == requesting_player
  end
end
