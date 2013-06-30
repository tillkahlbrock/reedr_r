require 'rss'
require 'open-uri'

class FeedReader
  def read feed
    url = feed.url
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items
    end
  end
end
