require 'securerandom'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

validates :url, uniqueness: true 
validates :url, format: {with: URI::regexp(['https','http'])} 
validates :shorturl, uniqueness: true
before_create :shorten



def shorten
 self.shorturl = SecureRandom.hex(3)
end


def addclick
# byebug
		if self.clickcount == nil
		self.update(clickcount:1)
	else
		n = self.clickcount
		n = n + 1
		self.update(clickcount:n)
	end
end

end
