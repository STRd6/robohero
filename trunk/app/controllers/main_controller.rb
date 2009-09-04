class MainController < ApplicationController
  def link
    link_id = Link.find_by_enc_id(params[:token]).id

    LinkEvent.find_or_create_by_link_id_and_session_id_and_state(
      link_id,
      session.session_id,
      :clicked
    )

    session[:link_id] = link_id

    if link.target
      redirect_to link.target
    else
      redirect_to '/'
    end
  end
end
