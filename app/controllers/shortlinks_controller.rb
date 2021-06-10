class ShortlinksController < ApplicationController

	def new
		@shortlink = Shortlink.new
	end

	def create
		@shortlink = Shortlink.new(original: shortlink_params[:original], url: SecureRandom.urlsafe_base64(6))
		@shortlink.user = current_user
		if @shortlink.save
			redirect_to root_path
		else
			redirect_to root_path, notice: "Unable to create shortened link, you may have already created this link"
		end
	end

	def redirect
		url = Shortlink.find_by(url: params[:url])
		url.clicks += 1
		url.save
		redirect_to url.original
	end

	private

	def shortlink_params
		params.require(:shortlink).permit(:original)
	end

end
