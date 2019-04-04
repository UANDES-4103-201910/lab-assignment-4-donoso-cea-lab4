class Event < ApplicationRecord
  	belongs_to :event_venue
  	has_many :ticket_types
		validate :start_date_cannot_be_in_the_past , :no2eventsinthesamevenue
	
	def start_date_cannot_be_in_the_past
    		if self.start_date < self.created_at
      			errors.add(:start_date, "can't be in the past")
    		end
  	end
	
	def no2eventsinthesamevenue
		obs = Event.where("start_date== ? and event_venue_id== ?",self.start_date, self.event_venue_id)
		if obs[1]!= nil
			errors.add(:start_date, "cant be the same")
		end
	end
		
		
		
end
