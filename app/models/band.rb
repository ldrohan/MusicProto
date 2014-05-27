class Band < ActiveRecord::Base
	has_many :albums
	has_many :users
end
