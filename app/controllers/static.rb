get '/' do
	@urls = Url.all
  erb :"static/index"
end

post '/urls' do

	a = Url.new(url:params[:long])

	a.save

	redirect '/'
end


get '/:shorturl' do	

	place = Url.find_by(shorturl: params[:shorturl])
	
	place.addclick

	redirect place.url


end