class User < ActiveRecord::Base

	before_save { email.downcase! }
	validates :name, presence: true, length: { maximum: 25 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i # Constant REGEXP
	validates :email, presence: true, length: { maximum: 255 },
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }

	has_secure_password

	validates :password, presence: true, length: { minimum: 6 }

	# Digest mean a cryptographic hash function which is infeasible to invert/break

	# fixture password // search

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end	
	
end
