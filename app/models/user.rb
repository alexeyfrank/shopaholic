# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  role            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :email, uniqueness: true, presence: true, email: true
  validates :password_digest, presence: true

 state_machine initial: :inactive do
    state :inactive
    state :active

    event :activate do
      transition from: :inactive, to: :active
    end

    event :deactivate do
      transition from: :active, to: :inactive
    end
  end

  include UserRepository
end
