class Backoffice::SessionsController < Backoffice::BackofficesController
  layout 'sessions'

  def new; end

  def create
    @admin = Admin.find_by(login: params[:login])
    if @admin&.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to backoffices_path
    else
      render :new, alert: 'Invalid login or password combination'
    end
  end
end
