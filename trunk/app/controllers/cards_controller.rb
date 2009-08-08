class CardsController < ResourceController::Base
  actions :all, :except => :destroy
end
