class SessionsController < ApplicationController

  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    if auth
      sign_in_with_auth(auth)
    else
      sign_in_with_password
    end
  end

  def destroy
    sign_out
    redirect_to :back
  end

end
