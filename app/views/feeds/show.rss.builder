xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:atom" => "http://www.w3.org/2005/Atom",  :version => "2.0" do
	xml.channel do
		xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => feed_url(@feed, :format => :rss)
		xml.title @feed.name
		#xml.description @show.description
		@items.each do |item|
			xml.item do
				xml.title item.title
				xml.description item.description
				xml.pubDate item.created_at.to_s(:rfc822)
				xml.enclosure :url=> item.audio_url, :type=>"audio/mp3"
				xml.link item.producthunt_url
				xml.guid item.audio_url
				#xml.itunes :image, :href => item.cover_image_url				
				#xml.itunes :image, :href => "https://s3.amazonaws.com/podcastApp/shows/images/000/003/486/original/china.png?1441692711"
				xml.image :href => "https://s3.amazonaws.com/podcastApp/shows/images/000/003/486/original/china.png?1441692711"
			end
		end	
	end # end of xml.channel
end # end of xml.rss	