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
      assert @game.begin_game

      assert_equal false, @game.open?
    end

    context "that has begun" do
      setup do
        @game.begin_game
      end

      should "be able to pass priority" do
        priority_player = @game.priority_player
        next_priority_player = (@game.players - [priority_player]).first

        @game.pass_priority

        assert_equal next_priority_player, @game.priority_player
      end
    end

    context "event transitions" do
      should "go from `upkeep_phase` to `first_main_phase` on `end_phase`" do
        @game.state = :upkeep_phase

        @game.end_phase

        assert @game.first_main_phase?
      end

      should "go from `first_main_phase` to `attack_phase` on `end_phase`" do
        @game.state = :first_main_phase

        @game.end_phase

        assert @game.attack_phase?
      end

      should "go from `attack_phase` to `second_main_phase` on `end_phase`" do
        @game.state = :attack_phase

        @game.end_phase

        assert @game.second_main_phase?
      end

      should "go from `second_main_phase` to `end_of_turn_phase` on `end_phase`" do
        @game.state = :second_main_phase

        @game.end_phase

        assert @game.end_of_turn_phase?
      end

      should "go from `end_of_turn_phase` to `upkeep_phase` on `end_phase`" do
        @game.state = :end_of_turn_phase

        @game.end_phase

        assert @game.upkeep_phase?
      end
    end
  end
end
