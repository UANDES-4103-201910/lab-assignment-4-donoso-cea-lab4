class EventVenue < ApplicationRecord
	validates :name, length: {minimum: 20}
	validates :capacity, numericality: true
	validates :capacity, numericality: {greater_than: 0}
end
