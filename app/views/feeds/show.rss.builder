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
				xml.enclosure :url=> item.audio_url
				xml.link item.producthunt_url
				xml.guid item.audio_url
				xml.image :image do
					xml.image :loc, item.cover_image_url
				end
			end
		end	
	end # end of xml.channel
end # end of xml.rss	