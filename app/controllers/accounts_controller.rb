class AccountsController < ResourceController::Base
  include FacebookController
  actions :all, :except => :destroy

  def assume
    if Rails.env == "production"
      redirect_to :back
    else
      self.current_account = Account.find(params[:id])
      redirect_to :back
    end
  end
end
