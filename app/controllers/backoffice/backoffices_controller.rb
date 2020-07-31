class Backoffice::BackofficesController < ActionController::Base
  layout 'backoffice'

  def current_user
    Admin.find_by(id: session[:admin_id])
  end

  def authorization
    redirect_to backoffice_path if current_user.nil?
  end

  def home
  end
end
