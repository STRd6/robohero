class MainController < ApplicationController
  def link
    session[:link_id] = Link.find_by_enc_id(params[:enc_id]).id

    LinkEvent.find_or_create_by_link_id_and_session_id_and_state(
      session[:link_id],
      session.session_id,
      :clicked
    )

    if link.target
      redirect_to link.target
    else
      redirect_to '/'
    end
  end
end
