# encoding: UTF-8
require 'open-uri'
desc 'Streamming tweets'  
task :find_tweets => :environment do
	$client.search('@podhunt #savethis', result_type: "recent").collect do |tweet|
		puts "#{tweet.user.screen_name}"
		puts "#{tweet.text}"		
		tweet_created_at = tweet.created_at
		tweet.urls.each do |url|
			if url.url
				page_url = url.url
				document = Nokogiri::HTML(open(page_url))
				if document					
					audio_url = document.at('meta[@name="og:audio:secure_url"]')
					if audio_url
						audio_title = document.at('meta[@property="og:title"]')
						audio_description = document.at('meta[@property="og:description"]')
						audio_image = document.at('meta[@property="og:image"]')
					end
				end				
			end
		end
	end
end