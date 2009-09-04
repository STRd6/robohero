require 'test_helper'

class MainControllerTest < ActionController::TestCase
  context "main controller" do
    context "link tracking" do
      setup do
        link = Factory :link
        @link_token = link.token
      end

      should "track clicks on links" do
        assert_difference "LinkEvent.count", 1 do
          get :process_link, :token => @link_token

          assert_redirected_to '/'
        end
      end
    end
  end
end
