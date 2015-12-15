# encoding: UTF-8
#require 'open-uri'
require 'open_uri_redirections'
desc 'Streamming tweets'  
task :find_tweets => :environment do
	if Item.count > 0
		tweet_since_id = Item.last.tweet_id
		tweets = $client.search('@podhunt #savethis', result_type: "recent", since_id: tweet_since_id)
	else
		tweets = $client.search('@podhunt #savethis', result_type: "recent")
	end		
	tweets.collect do |tweet|
		tweet_id = tweet.id
		if Item.find_by_tweet_id(tweet_id).nil?
			screen_name = tweet.user.screen_name		
			puts screen_name			
			tweet_created_at = tweet.created_at
			tweet.urls.each do |url|				
				if url.url
					page_url = url.url
					begin 
						open_url = open(page_url)
					rescue Exception => msg
					end
					if open_url
						document = Nokogiri::HTML(open_url)
						if document
							audio_url = document.at('meta[@name="og:audio:secure_url"]')[:content]
							if audio_url
								audio_title = document.at('meta[@property="og:title"]')[:content]
								audio_description = document.at('meta[@property="og:description"]')[:content]
								audio_image = document.at('meta[@property="og:image"]')[:content]
								producthunt_post_url = document.at('meta[@property="og:url"]')[:content]
								feed = Feed.find_by_name(screen_name)
								if feed
									# if feed exist then start saving the show
									p "save a new show #{audio_title} to #{screen_name}"
									item = Item.new(title:audio_title, audio_url:audio_url)							
									item.description = audio_description
									item.cover_image_url = audio_image
									item.created_at = tweet_created_at
									item.producthunt_url = producthunt_post_url
									item.tweet_id = tweet_id
									feed.items << item
									item.save!
									feed_url = "https://huntcast.herokuapp.com/feeds/#{screen_name}"
									$client.update("@screen_name now your can enjoy episodes on @Producthunt with @Overcastfm #{feed_url}")
								else
									# else we will create a new feed and save the show
									p "create a new feed: #{screen_name}"
									feed = Feed.new(name: screen_name)
									feed.save!
									p "save a new show #{audio_title} to #{screen_name}"
									item = Item.new(title:audio_title, audio_url:audio_url)							
									item.description = audio_description
									item.cover_image_url = audio_image
									item.created_at = tweet_created_at
									item.producthunt_url = producthunt_post_url
									item.tweet_id = tweet_id
									feed.items << item
									item.save!								
								end
							end
						end
					end			
				end
			end
		end
	end
end