require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"
require 'byebug'

helpers do
	def count_interest(users)

	end
end
before do
	@users = YAML.load_file('users.yaml')
end

get '/' do
	redirect '/users'
end

get '/users' do
	erb :users
end

get '/:user' do
	@user = params[:user].to_s
  erb :user
end
