class GameEvent < ActiveRecord::Base
  belongs_to :game
  belongs_to :datum, :polymorphic => true
end
