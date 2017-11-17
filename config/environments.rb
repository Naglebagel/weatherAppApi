configure :production, :development do
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/weather')

	ActiveRecord::Base.establish_connection(
		:adapter  => db.schema == 'postgres' ? 'postgresql' : db.schema,
		:host     => db.host,
		:username => db.user,
		:password => db.password,
		:database => db.path[1..-1],
		:encoding => 'utf8'
		)
	
end