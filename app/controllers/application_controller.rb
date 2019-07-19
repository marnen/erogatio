class ApplicationController < ActionController::Base
  private

  def not_authenticated
    redirect_to login_path, alert: "Please log in first"
  end
end
