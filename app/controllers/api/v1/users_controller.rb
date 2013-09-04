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

  def show
    user = User.find params[:id]
    respond_with user
  end

  def update
    user = Api::V1::UpdateUserType.find params[:id]
    user.update_attributes params[:user]
    respond_with user
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    respond_with user
  end
end
