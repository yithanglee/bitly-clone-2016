# require 'securerandom'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

validates :url, uniqueness: true
validates :shorturl, uniqueness: true


def self.fuzzy

	a = ("a".."z").to_a
	b = ("A".."Z").to_a
	c = []
	c << a
	c << b
	c = c.flatten
	n = []
		for i in 1..10 do
		 	n << c[rand(51)]
		end
		n = n.join
		return n

end


def self.shortener(link)
a = Url.find_by(url:link)
	if a.nil?
		p "this link doesnt exist, hence it will be shortened"
		n = fuzzy
		create(url:link, shorturl:n)
	else
		p "this link already exist"
	end
end


end
