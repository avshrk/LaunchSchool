require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
	@title = "Public Directory Listing"
	@contents = Dir.glob("public/*").map { |file| File.basename(file) }.sort
  @contents.reverse! if params[:sort] == 'desc'
	erb :list

end
