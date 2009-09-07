require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  context "A player" do
    setup do
      game = Factory :game
      @player = Factory :player, :game => game
    end

    should "belong to an account" do
      assert @player.account
    end

    context "with cards" do
      setup do
        GameCard.create(:location_id => @player.id, :location_type => "Hand", :card => Factory(:card))
        GameCard.create(:location_id => @player.id, :location_type => "Hand", :card => Factory(:card))
        GameCard.create(:location_id => @player.id, :location_type => "Deck", :card => Factory(:card))
        GameCard.create(:location_id => @player.id, :location_type => "Deck", :card => Factory(:card))
        GameCard.create(:location_id => @player.id, :location_type => "Discard", :card => Factory(:card))
        GameCard.create(:location_id => @player.id, :location_type => "Discard", :card => Factory(:card))
      end

      should "have cards in hand" do
        assert @player.cards_in_hand
      end

      should "have cards in deck" do
        assert @player.cards_in_hand
      end

      should "have cards in discard" do
        assert @player.cards_in_hand
      end

      context "drawing a card" do
        should "have one fewer cards in deck and one greater cards in hand" do
          assert_difference "@player.cards_in_hand.size", 1 do
            assert_difference "@player.cards_in_deck.size", -1 do
              assert_difference "@player.cards_in_discard.size", 0 do
                @player.draw 1
              end
            end
          end
        end
      end
    end
  end
end
