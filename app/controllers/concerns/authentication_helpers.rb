module AuthenticationHelpers
  extend ActiveSupport::Concern

  def current_user
    @current_user ||= User.where(id: current_session.id).find_by(
      'password_digest LIKE ?', "#{current_session.password}%" # Full password isn't stored client side
    )
  end

  included do
    helper_method :current_user
  end

  def authorize_session!
    store_after_login_path
    return if current_user

    session[:user] = nil
    redirect_to login_path, alert: t('auth.log_in.alert')
  end

  protected

  def store_user_in_session
    session[:user] = [@user.id, @user.password_digest[0, 29]]
  end

  private

  def current_session
    OpenStruct.new(
      id: session[:user].is_a?(Array) && session[:user][0],
      password: session[:user].is_a?(Array) && session[:user][1]
    )
  end

  def store_after_login_path
    session[:after_login_path] = request.path
  end
end
