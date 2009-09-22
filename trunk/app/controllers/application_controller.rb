# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Facebooker::Rails::Controller
  include TheAuthenticator

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :set_up_account

  helper_method :fb_uid, :fb_user, :facebook_session

  private

  def set_up_account
    # Check session/cookie
    # return if current_account
    #TODO: Don't make FB only, eventually
    # Check FB
    if set_facebook_session
      self.current_account = FacebookLogin.establish_account(facebook_session.user.uid)
    end
    # Twitter?
    # Other Auth mechanisms?
  end

  def fb_uid
    facebook_session.user.uid if facebook_session
  end

  def fb_user
    facebook_session.user if facebook_session
  end

  def ensure_deck_list
    if current_account && current_account.deck_lists.first
      if current_account.deck_lists.first.valid?
        true
      else
        false
      end
    else
      false
    end
  end
end
