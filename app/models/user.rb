class User < ApplicationRecord
  has_many :orders
	validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
	validates :phone, length: {minimum: 9}
	validates :phone, length: {maximum: 12}
end
