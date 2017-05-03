class UsersController < CrudController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_admin, only: [:new, :create]

  def index
    @users = User.paginate(:page => params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    respond_with(@user, location: @user)
  end

  def update
    @user.update(user_params)
    respond_with(@user, location: @user)
  end

  def destroy
    @user.destroy
    respond_with(@user, location: root_path)
  end

  private

  def authorize_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :active, :password, :password_confirmation)
  end
end
