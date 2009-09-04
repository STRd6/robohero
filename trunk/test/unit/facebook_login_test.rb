require 'test_helper'

class FacebookLoginTest < ActiveSupport::TestCase
  context "a facebook login" do
    setup do
      @login = Factory :facebook_login
    end

    should "belong to an account" do
      assert @login.account
    end
  end
end
