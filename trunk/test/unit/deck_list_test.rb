require 'test_helper'

class DeckListTest < ActiveSupport::TestCase
  context "a deck list" do
    setup do
      @deck_list = Factory :deck_list
    end

    should "have a version" do
      assert @deck_list.version
    end

    should "have a name" do
      assert @deck_list.name
    end

    should "belong to an account" do
      assert @deck_list.account
    end

    should "have cards" do
      assert @deck_list.cards
    end

    should "have a unique name per account" do
      assert_raise ActiveRecord::RecordInvalid do
        Factory :deck_list,
          :account => @deck_list.account,
          :name => @deck_list.name
      end
    end
  end
end
