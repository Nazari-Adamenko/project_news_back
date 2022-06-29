class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         # :timeoutable,
         jwt_revocation_strategy: JwtDenylist
  validates :name, presence: true
  has_many :posts
end
