class GamesController < ResourceController::Base
  include FacebookController
  actions :all, :except => [:update, :destroy]

  before_filter :login_required, :ensure_deck_list, :except => [:show, :index]

  before_filter :ensure_priority, :except => [:new, :join, :create, :show, :index, :start]
  before_filter :ensure_active, :except => [:new, :join, :create, :show, :index, :start]
  before_filter :ensure_main_phase, :only => :deploy
  before_filter :ensure_attack_phase, :only => :attack

  helper_method :is_priority_player?

  def start
    object.begin_game
    object.save!
    redirect_to object
  end

  def join
    object.join(current_account, current_account.deck_lists.first)
    object.save!
    
    redirect_to object
  end

  def deploy
    game_card = requesting_player.cards_in_hand.find(params[:card_id])
    
    requesting_player.deploy(game_card, params[:slot_type], params[:position])

    redirect_to object
  end

  def instant
    game_card = requesting_player.cards_in_hand.find(params[:card_id])

    requesting_player.play(game_card)

    redirect_to object
  end

  def pass_priority
    object.pass_priority
    object.save!
    redirect_to object
  end

  def attack
    params[:attack_declarations].each do |player_id, weapons|
      target_player = object.players.find(player_id)
      attacking_cards = object.active_player.equipped_cards.find(weapons)

      damage_array = attacking_cards.inject([]) do |array, card|
        array += card.attack
      end

      target_player.receive_damage(damage_array)
    end
    
    redirect_to object
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

  def ensure_attack_phase
    unless object.attack_phase?
      flash[:error] = "Not in attack phase!"
      redirect_to object
    end
  end

  def ensure_priority
    unless is_priority_player?
      flash[:error] = "You do not have priority!"
      redirect_to object
    end
  end

  def ensure_active
    unless is_active_player?
      flash[:error] = "You are not the active player!"
      redirect_to object
    end
  end

  def is_priority_player?
    object.priority_player == requesting_player
  end

  def is_active_player?
    object.active_player == requesting_player
  end
end
