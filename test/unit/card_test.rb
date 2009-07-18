require 'test_helper'

class CardTest < ActiveSupport::TestCase
  context "Card" do
    setup do
      @card = Factory :card
    end

    should "have a non-negative dollar cost" do
      assert @card.dollar_cost >= 0
    end

    should "have a non-negative energy cost" do
      assert @card.energy_cost >= 0
    end

    should "have a non-negative ready time" do
      assert @card.ready_time >= 0
    end
  end
end
