require 'digest'
class User < ActiveRecord::Base
	attr_accessible :username, :email, :password, :password_confirmation, :bio
	has_secure_password

	scope :top6,
		joins(:resources).
		group("users.id").
		select("users.id, users.username, users.email, users.bio, sum(resources.upvotes_count) AS order_by").
		order("order_by DESC")

	has_many :resources
	has_many :upvotes

	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship"
	has_many :followers, through: :reverse_relationships, source: :follower

	searchable do
		text :username, :default_boost => 2
		text :bio
	end

	validates :username, uniqueness: { case_sensitive: false }, length: { :in => 3..20 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }, :on => :create
	validates :password_confirmation, presence: true, :on => :create
	validates_format_of :username, :with => /^[A-Za-z\d_]+$/

	# before_save :encrypt_password

	before_create { |user| user.username = username.downcase }
	before_create :create_remember_token
	

	def has_password?(submitted_password)
		encrypted_password = encrypt(submitted_password)
	end

	# def following?(other_user)
	# 	relationships.find_by_followed_id(other_user.id)
	# end

	# def follow!(other_user)
	# 	relationships.create!(followed_id: other_user.id)
	# end

	# def unfollow!(other_user)
	# 	relationships.find_by_followed_id(other_user.id).destroy
	# end

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

		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end