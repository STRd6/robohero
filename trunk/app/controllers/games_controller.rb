class GamesController < ResourceController::Base
  actions :all, :except => :destroy
end