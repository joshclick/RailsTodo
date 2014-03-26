class Admin::UsersController < Admin::AdminController
  respond_to :html

  def index
    @users = User.all
  end
end
