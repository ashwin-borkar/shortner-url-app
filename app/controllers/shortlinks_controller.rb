class ShortlinksController < ApplicationController

	def new
		@shortlink = Shortlink.new
	end

	def create
		if helpers.shorten_link(shortlink_params[:original])
			bitlink = helpers.shorten_link(shortlink_params[:original])
			@shortlink = Shortlink.new(original: shortlink_params[:original], url: bitlink.link)
			@shortlink.user = current_user
			if @shortlink.save
				redirect_to root_path
			else
				redirect_to root_path 
			end
		else
			flash[notice] = "Please enter valid URL"
		end
	end

	private

	def shortlink_params
		params.require(:shortlink).permit(:original)
	end

end
