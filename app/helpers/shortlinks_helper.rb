module ShortlinksHelper

	def shorten_link(url)
		@client = Bitly::API::Client.new(token: ENV['BITLY_API'])
		begin
			@client.shorten(long_url: url)
		rescue
			false
		end
	end

	def clicks(link)
		link = link[8, link.length-8]
		headers = {'Authorization': ENV['BITLY_API']}
		response = HTTParty.get("https://api-ssl.bitly.com/v4/bitlinks/#{link}/clicks", headers: headers)
		arr = []
		response["link_clicks"].each do |links|
			arr << links['clicks'].to_i
		end
		arr.sum
	end
end
