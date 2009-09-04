# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Facebooker::Rails::Controller

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :set_up_user

  helper_method :fb_uid

  private

  def set_up_user
    #TODO: Don't make FB only, eventually
    if set_facebook_session
      @current_account = FacebookLogin.establish_account(facebook_session.user.uid)
    end
  end

  def establish_credentials
    #TODO:
    # Check cookies
    # Check FB
    # Twitter?
    # Other Auth mechanisms?
  end

  def fb_uid
    facebook_session.user.uid if facebook_session
  end
end
