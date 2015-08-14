class User < ActiveRecord::Base
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\Z/

	validates_presence_of :email, :full_name, :location
	validates_length_of :bio, minimum: 20, allow_blank: false
	validates_format_of :email, with: EMAIL_REGEXP

	scope :confirmed, -> {where.not(confirmed_at: nil)}


	has_secure_password

	before_create do |user|
		user.confirmation_token = SecureRandom.urlsafe_base64
	end
	
	def confirm!
		return confirmed?

		self.confirmed_at = Time.current
		self.confirmation_token = ''
		save!		
	end

	def confirmed?
		confirmed_at.present?
	end

	def self.authenticate(email, password)
		user = confirmed.find_by(email: email).try(:authenticate, password)
	end
end
