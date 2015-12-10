desc 'Streamming tweets'  
task :find_tweets => :environment do
	$client.search('@podhunt #savethis', result_type: "recent").collect do |tweet|
		puts "#{tweet.user.screen_name}"
		puts "#{tweet.text}"
		text_parse = /(.*)(https:\/\/t.co\/[A-Za-z0-9]*)(.*)/.match(tweet.text)
		if text_parse
			producthunt_page = text_parse[2]
			puts producthunt_page
		end
	end
end