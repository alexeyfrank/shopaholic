class Api::V1::UpdateUserType < User
  include ApplicationType

  permit :email, :password
end
