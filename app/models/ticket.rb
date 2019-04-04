class Ticket < ApplicationRecord
  	belongs_to :ticket_type
  	belongs_to :order
	before_save :ticket_cannot_be_created
	
	def ticket_cannot_be_created
		sql = "select t.id from tickets t, ticket_types tt, events e where t.ticket_type_id = tt.id  and tt.event_id = e.id and date(e.start_date) < date(t.created_at)"
		result = ActiveRecord::Base.connection.execute(sql)
		hola = Event.find(result[0]['t.id'])
		if hola != nil
			errors.add(:created_at , "mala fecha po perrito")
		end
	end
		
		
end
