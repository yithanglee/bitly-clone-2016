class AddIndex < ActiveRecord::Migration
	def change
		add_index :urls, :id
		
	end
end
