class ShortlinksController < ApplicationController

	def new
		@shortlink = Shortlink.new
	end

	def create
		client = Bitly::API::Client.new(token: ENV['BITLY_API'])
		bitlink = client.shorten(long_url: shortlink_params[:original])
		@shortlink = Shortlink.new(original: shortlink_params[:original], url: bitlink.link)
		@shortlink.user = current_user
		if @shortlink.save
			redirect_to root_path
		else
			redirect_to root_path 
		end
	end

	private

	def shortlink_params
		params.require(:shortlink).permit(:original)
	end

end
