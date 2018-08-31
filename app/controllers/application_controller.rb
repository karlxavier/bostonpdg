class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :user_notification_count

  def user_notification_count
    @notifications_count = Audit.unread_count(current_user.last_notified)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password, :password_confirmation, roles: []])
  end

  def authenticate_current_user
    head :unauthorized if get_current_user.nil?
  end

  def get_current_user
    return nil unless cookies[:auth_headers]
    auth_headers = JSON.parse(cookies[:auth_headers])

    expiration_datetime = DateTime.strptime(auth_headers["expiry"], "%s")
    current_user = User.find_by(uid: auth_headers["uid"])

    if current_user &&
        current_user.tokens.has_key?(auth_headers["client"]) &&
        expiration_datetime > DateTime.now

      @current_user = current_user
    end
    @current_user
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || orders_path
  end
  
end
