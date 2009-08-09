require 'test_helper'

class DeckListTest < ActiveSupport::TestCase
  context "a deck list with some card data" do
    setup do
      @cards = [
        Factory(:card),
        Factory(:card)
      ]

      @deck_list = Factory :deck_list,
        :cards => @cards
    end

    should "have the cards present in the deck list" do
      assert @deck_list.cards.include?(@cards.first)
      assert @deck_list.cards.include?(@cards.last)
    end
  end
end
