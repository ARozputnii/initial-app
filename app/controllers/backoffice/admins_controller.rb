class Backoffice::AdminsController < Backoffice::BackofficesController
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @admins = Admin.all
  end

  def show; end

  def new
    @admin = Admin.new
  end

  def edit; end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to backoffice_admins_path, notice: 'Admin was successfully created.'
    else
      render :new
    end
  end

  def update
    admin = Admin.find_by(login: admin_params['login']).authenticate(admin_params['old_pass'])
    if admin == @admin
      @admin.update(admin_params)
      redirect_to backoffice_admins_path, notice: 'User was successfully updated.'
    else
      redirect_to edit_backoffice_admin_path, alert: 'Invalid old or new/confirmation password'
    end
  end

  def destroy
    @admin.destroy
    redirect_to backoffice_admins_path, notice: 'Admin was successfully destroyed.'
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:login, :password, :old_pass, :password_confirmation)
  end
end
