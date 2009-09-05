require 'test_helper'

class GameTest < ActiveSupport::TestCase
  context "a game" do
    setup do
      @game = Factory :game
      @game.players = [
        Factory(:player, :game => @game),
        Factory(:player, :game => @game),
      ]
    end

    should "be able to start" do
      assert @game.start
    end
  end
end
