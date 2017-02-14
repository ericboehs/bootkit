class PasswordResetsController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new; end

  def create
    @user = User.find_by email: params[:password_reset][:email]
    @user&.send_password_reset
    redirect_to root_url, notice: t('.notice')
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      store_user_in_session
      redirect_to root_url, notice: t('.notice')
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by! perishable_token: params[:id]
  end

  def user_params
    params.require(:user).permit :password
  end
end
