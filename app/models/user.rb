class User < ApplicationRecord

  devise :database_authenticatable,
        :jwt_authenticatable,
        :registerable,
        # :timeoutable,
        jwt_revocation_strategy: JwtDenylist
        
        has_many :posts
end
