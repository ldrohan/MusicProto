class Band < ActiveRecord::Base
	belongs_to :album
	belongs_to :user
end
