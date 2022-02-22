class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :confirmable,
         :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :validatable,
         jwt_revocation_strategy: self

  ## VALIDATIONS ##
  validates :name, presence: true
  validates :name, length: { maximum: 32 }
end
