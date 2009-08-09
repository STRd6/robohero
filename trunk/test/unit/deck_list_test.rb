require 'test_helper'

class DeckListTest < ActiveSupport::TestCase
  context "a deck list" do
    setup do
      @deck_list = Factory :deck_list
    end

    should "have a version" do
      #TODO
    end

    should "have a name" do
      assert @deck_list.name
    end

    should "belong to an account" do
      assert @deck_list.account
    end

    should "have a unique name per account" do
      #TODO
    end
  end
end
