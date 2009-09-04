require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  context "a link" do
    setup do
      @link = Factory :link
    end

    should "have a url" do
      assert @link.url
    end

    should "have a unique token" do
      assert @link.token
    end

    should "be able to have a target" do
      account = Factory :account

      @link.target = account
      @link.save!
      @link.reload

      assert_equal account, @link.target
    end
  end
end
