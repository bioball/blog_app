module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
    flash[:success] = "Signed in"
    redirect_to root_url
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def sign_in_with_auth(auth)
    user = User.find_by(uid: auth["uid"])
    if user
      sign_in user
    else
      user = User.create_with_omniauth(auth)
      sign_in user
    end
  end

  def sign_in_with_password
    user = User.find_by(email: params[:session][:email].downcase)
    if user.authenticate(params[:session][:password]) == user && user.provider.nil?
      sign_in user
    else
      flash[:failure] = "Email and password do not match"
      redirect_to signin_path
    end
  end
end
