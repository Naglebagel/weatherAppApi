class AppController < Sinatra::Base

	

	require 'bundler'
	Bundler.require

	

	register Sinatra::CrossOrigin


	use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :secret => 'some-random-string'

	ActiveRecord::Base.establish_connection(
		:adapter => 'postgresql',
		:database => 'weather'
		)

	configure do
		enable :cross_origin
	end	

	# set :allow_origin, :any
	# set :allow_methods, [:get, :post, :options]

	use Rack::MethodOverride

  	set :method_override, true

  	before do
	    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
	    headers['Access-Control-Allow-Origin'] = 'http://localhost:3000'
	    headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
	    headers['Access-Control-Allow-Credentials'] = 'true'

  end

	set :public, File.expand_path('../public', File.dirname(__FILE__))
	set :views, File.expand_path('../views', File.dirname(__FILE__))

	not_found do
		'Not Found'
	end
end

