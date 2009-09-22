class Game < ActiveRecord::Base
  has_many :players

  belongs_to :active_player, :class_name => "Player"
  belongs_to :priority_player, :class_name => "Player"

  has_many :game_events
  belongs_to :current_event

  named_scope :open, :conditions => {:state => "open"}

  include AASM

  aasm_column :state

  aasm_state :open, :exit => :start_game
  aasm_state :upkeep_phase, :enter => :do_upkeep
  aasm_state :first_main_phase
  aasm_state :attack_phase
  aasm_state :second_main_phase
  aasm_state :end_of_turn_phase, :exit => :end_turn
  aasm_state :completed

  aasm_event :end_phase do
    transitions :to => :first_main_phase, :from => [:upkeep_phase]
    transitions :to => :attack_phase, :from => [:first_main_phase]
    transitions :to => :second_main_phase, :from => [:attack_phase]
    transitions :to => :end_of_turn_phase, :from => [:second_main_phase]
    transitions :to => :upkeep_phase, :from => [:end_of_turn_phase]
  end

  aasm_event :begin_game do
    transitions :to => :first_main_phase, :from => [:open]
  end

  def start_game
    transaction do
      self.rotation_offset = rand(players.size)
      set_active_player
      # Each player shuffles deck and draws 7 cards
      players.each do |player|
        player.shuffle_deck
        player.draw 7
      end
      save!
    end
  end

  def end_turn
    self.turn += 1
    set_active_player
    save!
  end

  def pass_priority
    next_player_index = (players.index(priority_player) + 1) % players.size
    self.priority_player = players[next_player_index]

    if priority_player == active_player
      end_phase
    end

    save!
  end

  def do_upkeep
    active_player.do_upkeep(income)
  end

  def discard(game_card)
    game_card.location_type = "Discard"
    game_card.save!
  end

  def join(account, deck_list)
    unless players.map(&:account_id).include? account.id
      player = players.build(:game => self, :account => account, :robot => Robot.first)
      player.deck_list = deck_list
    end
  end

  def income
    2
  end

  def channel
    :"game_#{id}"
  end

  private
  def set_active_player
    next_player_index = (turn + rotation_offset) % players.size
    self.active_player = players[next_player_index]
    self.priority_player = active_player
  end
end
