class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotDefinedError, with: :user_not_authorized
  add_flash_types :friendlyAlert

  private

  # Alerts the user that they cannot perform the action. This may be because they are not signed in or they don't have the privileges to perform the desired action.
  def user_not_authorized
    flash[:alert] = "You are not authorized to access this resource"
    redirect_to(request.referrer || root_path)
  end

end

