class UserController < AppController

	# options "*" do
 #    	response.headers["Access-Control-Allow-Methods"] = "HEAD,GET,POST,PUT,PATCH,DELETE,OPTIONS"
	# end

	get '/' do
		# response['Access-Control-Allow-Origin'] = '*'
		@user = User.all
		@user.to_json
	end

	get '/cities' do
		@user = User.find_by(username: session[:username])
		@usercities = @user.cities

		p @usercities

		@usercities.to_json
	end	

	post '/' do 
		
		@user = User.new
		@user.username = params[:username]
		@user.password = params[:password]
		@user.save

		@user.to_json
	end

	post '/login' do

		@password = params[:password]
		@user = User.find_by(username: params[:username])

	

		session[:username] = @user[:username]
		session[:id] = @user.id

		p session

		if @user && @user.authenticate(@password)
			'hey your logged in'
		end
	end

	get '/logout' do
		session.clear

		p session
	end	
end




