class User < ApplicationRecord
  has_many :orders
	validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
	validates :phone, numericality: true
	validates :phone, numericality: {only_integer: true}
	validates :phone, length: {minimum: 9}
	validates :phone, length: {maximum: 12}
	validates :password, length: {minimum: 8, maximum:12}

end
