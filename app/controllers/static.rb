get '/' do
	@urls = Url.all
  erb :"static/index"
end

post '/urls' do

	slug = params.values_at("abc")
	slug = slug.join
	a = Url.shortener(slug)
# Url.select(:shorturl).find_by(url:slug)

	redirect '/'
end


get '/'+ 'tYJJXWfIqA' do

  erb :"static/right"

end