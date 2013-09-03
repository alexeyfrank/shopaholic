class Api::V1::SessionsController < Api::V1::ApplicationController

  def create
    @type = Api::V1::UserSignInType.new params[:user]
    if @type.valid?
      user = @type.user
      sign_in user
      respond_with user, location: nil
    else
      respond_with @type, status: :unprocessable_entity
    end
  end

  def show
    respond_with current_user, location: nil
  end

  def destroy
    sign_out
    head :ok
  end
end

