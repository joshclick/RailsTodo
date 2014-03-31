class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :authenticate_any!

  def authenticate_any!
    if admin_signed_in?
      true
    else
      authenticate_user!
    end
  end

  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_path, alert: exception.message
  # end
end
