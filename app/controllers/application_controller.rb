class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  private

  def not_authenticated
    redirect_to login_path, alert: "Please log in first"
  end
end
