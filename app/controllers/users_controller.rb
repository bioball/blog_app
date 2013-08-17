class UsersController < ApplicationController
  before_action :admin_user, only: :destroy
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "#{user.name} has been deleted."
    redirect_to root_path
  end

  private

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
