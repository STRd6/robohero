require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  context "a game" do
    setup do
      @game = Factory :game
    end

    should "be viewable" do
      get :show, :id => @game.id
    end
  end
end
