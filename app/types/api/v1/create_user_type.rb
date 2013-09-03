class Api::V1::CreateUserType < User
  include ApplicationType

  permit :email, :password, :password_confirmation
end
