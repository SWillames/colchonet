class User < ActiveRecord::Base
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\Z/

	validates_presence_of :email, :full_name, :location
	validates_length_of :bio, minimum: 20, allow_blank: false
	validates_format_of :email, with: EMAIL_REGEXP


	has_secure_password
end
