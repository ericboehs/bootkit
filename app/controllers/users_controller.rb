class UsersController < ApplicationController
  before_action :authorize_session!, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    return redirect_to root_path if current_user
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new user_params

    if @user.save
      store_user_in_session
      redirect_to root_path, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if changing_password? && password_incorrect?
      return redirect_to edit_user_path(@user), alert: t('.password_incorrect')
    end

    if @user.update user_params
      store_user_in_session
      redirect_to edit_user_path(@user), notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    session[:user] = nil
    @user.destroy
    redirect_to root_path, notice: t('.notice')
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit :name, :email, :password
  end

  def changing_password?
    user_params[:password].present?
  end

  def password_incorrect?
    !@user&.authenticate(params[:user][:current_password])
  end
end
