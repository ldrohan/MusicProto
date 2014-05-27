class Album < ActiveRecord::Base
	has_many :bands
	has_many :users, through: :bands
end
