class Feed < ActiveRecord::Base
	has_many :items
	extend FriendlyId
	friendly_id :name
	#https://www.youtube.com/watch?v=P1YE94bby4A
end
