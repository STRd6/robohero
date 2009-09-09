class DeckListsController < ResourceController::Base
  include FacebookController
  actions :all, :except => :destroy

  def collection
    current_account.deck_lists
  end

  def object
    @object ||= current_account.deck_lists.find(params[:id])
  end

  def build_object
    return @object if @object
    attributes = (object_params || {}).merge!(:account => current_account)
    @object = DeckList.new attributes
  end
end
