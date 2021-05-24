class PagesController < ApplicationController
  def home
  	@user = current_user
  	@shortlink = Shortlink.new
  	@shortlinks = current_user.shortlinks
  	@clicks = helpers.clicks(@shortlinks.first.url)
  end
end
