require 'digest'
class User < ActiveRecord::Base
	attr_accessor :password

	validates :username, :uniqueness => true
	validates :email, :uniqueness => true

	before_save :encrypt_password

	def has_password?(submitted_password)
		encrypted_password = encrypt(submitted_password)
	end

	def authenticate(email, submitted_password)
	    user = User.find_by_email(email)
	    if user.nil?
	      nil
	    elsif user.has_password?(submitted_password)
	      user
	    end
	end

	def self.home_list
		uncached do
			order("upvotes DESC").limit(4)
		end
	end

	private

		def encrypt_password
			self.salt = make_salt unless has_password?(password)
			self.encrypted_password = encrypt(password)
		end

		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end

		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end

		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
end