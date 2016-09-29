get '/' do
	@urls = Url.all
  erb :"static/index"
end

post '/urls' do

	a = Url.new(url:params[:long])

	if a.save
		redirect '/'
	else
		#show errors messages
		@errors_messages = a.errors.full_messages

		@urls = Url.all
		erb :"static/index"
	end
end


get '/:shorturl' do	

	place = Url.find_by(shorturl: params[:shorturl])
	place.addclick
	redirect place.url

end