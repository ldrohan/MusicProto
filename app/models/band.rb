class Band < ActiveRecord::Base
	validates :name, presence: true
	has_many :albums
	has_many :users
end
