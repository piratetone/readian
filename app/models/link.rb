class Link < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments

	# URL Validation
	validates :url, :format => URI::regexp(%w(http https))
	#Possible solutions found here - http://stackoverflow.com/questions/7167895/whats-a-good-way-to-validate-links-urls-in-rails-3

	def score
  	self.get_upvotes.size - self.get_downvotes.size
	end
	
end
