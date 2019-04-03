class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotDefinedError, with: :user_not_authorized



private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action. If you are not signed in, please sign in to access that page"
    redirect_to(request.referrer || root_path)
  end

end

