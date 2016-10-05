require 'securerandom'
require 'benchmark'

class Importer

	def initialize

		file = File.open("urls", 'r')

puts Benchmark.measure {

		file.each do |row| 
		Url.transaction do
		# byebug
		row = row.tr(";,(),\n", "")
		
		Url.connection.execute "INSERT INTO urls (url,shorturl,created_at,updated_at) VALUES ('#{row}','#{SecureRandom.hex(3)}', '#{DateTime.now}','#{DateTime.now}')"
				end
			end
}
	end

end



file1 = Importer.new



