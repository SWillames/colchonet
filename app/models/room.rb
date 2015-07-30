class Room < ActiveRecord::Base

	validates_presence_of :title, :description, :location
	validates_length_of :description, minimum: 20, allow_blank: false
	
	def complete_name
		"#{title}, #{location}"
	end
end
