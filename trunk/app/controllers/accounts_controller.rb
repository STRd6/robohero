class AccountsController < ResourceController::Base
  include FacebookController
  actions :all, :only => [:show, :edit, :update]

  before_filter :login_required

  def assume
    if Rails.env == "production"
      redirect_to :back
    else
      self.current_account = Account.find(params[:id])
      redirect_to :back
    end
  end

  def activate
    logout_keeping_session!
    code = params[:activation_code]

    account = Account.find_by_activation_code(code) unless code.blank?

    case
    when (!code.blank?) && account && !account.active?
      account.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when code.blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else
      flash[:error]  = "We couldn't find a account with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end

  private
  def object
    @account = current_account
  end
end
