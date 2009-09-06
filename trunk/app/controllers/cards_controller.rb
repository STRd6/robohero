class CardsController < ResourceController::Base
  include FacebookController
  actions :all, :except => :destroy
end
