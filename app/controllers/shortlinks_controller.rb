class ShortlinksController < ApplicationController

	def new
		@shortlink = Shortlink.new
	end

	def create
		client = Bitly::API::Client.new(token: ENV['BITLY_API'])
		bitlink = client.shorten(long_url: params[:shortlink][:original])
		@shortlink = Shortlink.new(original: params[:shortlink][:original], url: bitlink.link)
		@shortlink.user = current_user
		if @shortlink.save
			redirect_to root_path
		else
			redirect_to root_path 
		end
	end

end
