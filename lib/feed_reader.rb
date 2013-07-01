require 'rss'
require 'open-uri'

class FeedReader
  def read feed
    url = feed.url
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.inject([]) do |issues, item|
        issues << { :guid => item.link, :title => item.title }
      end
    end
  end
end
