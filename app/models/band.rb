class Band < ActiveRecord::Base
	validates :name, presence: true
	has_many :albums
	belongs_to :user
end
