class Api::V1::UsersController < Api::V1::ApplicationController
  def index
    users = User.ransack(params[:q]).result(distinct: true).page(params[:page])
    respond_with users
  end

  def create
    user = Api::V1::CreateUserType.new params[:user]
    user.save
    respond_with user, location: nil
  end
end
