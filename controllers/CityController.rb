class CityController < AppController

	get '/:id' do
		@city = City.find_by(id: params[:id])
		@city.to_json
	end	

	put '/:id' do
		@city = City.find_by(id: params[:id])
		p @city
		@city.cityname = params[:cityname]
		@city.countrycode = params[:countrycode]
		@city.save

		@city.to_json
	end	

	delete '/:id' do
		@city = City.find_by(id: params[:id])
		@city.delete
	end	

	post '/create' do
		@city = City.new
		@city.cityname = params[:cityname]
		@city.countrycode = params[:countrycode]
		@city.user_id = session[:id]
		@city.save

		p session

		@city.to_json
	end

end