class Admin::UsersController < Admin::AdminController
  respond_to :html

  def index
    @users = User.all
  end

  def show
    sign_in(:user, User.find(params[:id]))
    redirect_to root_url
  end
end
