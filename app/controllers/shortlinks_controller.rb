class ShortlinksController < ApplicationController
require 'socket'
require "net/http"


	def new
		@shortlink = Shortlink.new
	end

	def create
		results = Geocoder.search("1.10.10.0")
		cordinate = results.first.coordinates
		country = results.first.country
		# raise country.inspect
		@shortlink = Shortlink.new(original: shortlink_params[:original],)
		@shortlink.user = current_user
		@shortlink.ip_address = "1.10.10.0"
		@shortlink.country = country
		if @shortlink.save
			redirect_to root_path, notice: "Successfully created shortened link"
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
