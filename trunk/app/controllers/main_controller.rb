class MainController < ApplicationController
  def process_link
    if(link = Link.find_by_token(params[:token]))
      LinkEvent.find_or_create_by_link_id_and_session_id_and_action(
        link.id,
        session.session_id,
        :clicked
      )

      session[:link_id] = link.id

      if link.target
        redirect_to link.target
      else
        redirect_to '/'
      end
    else
      redirect_to '/'
    end
  end

  def index
    
  end
end
