class Event < ApplicationRecord
  	belongs_to :event_venue
  	has_many :ticket_types
	validate :expiration_date_cannot_be_in_the_past 
	
	def expiration_date_cannot_be_in_the_past
    		if self.start_date < self.created_at
      			#errors.add(:start_date, "can't be in the past")
    		end
  	end
end
