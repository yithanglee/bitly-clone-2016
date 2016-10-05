get '/' do
	@urls = Url.all
  erb :"static/index"
end

post '/urls' do

	@url = Url.new(url:params[:long])

	if @url.save
		return @url.to_json
			# @urls = Url.all
  	# 	erb :"static/index"
	else
		#show errors messages
		@errors_messages = {errors: @url.errors.full_messages}
	return @errors_messages.to_json

	end

end


get '/:shorturl' do	

	place = Url.find_by(shorturl: params[:shorturl])
	place.addclick
	redirect place.url

end