class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
  end

  def new
  end

  def create
    @feed = Feed.new(post_params)
    @feed.save
    
    redirect_to @feed
  end

  def show
    @feed = Feed.find(params[:id])
  end

  def load
    feed_reader = FeedReader.new
    issues = feed_reader.read(params[:id])
    render text: issues.inspect
  end

private
  def post_params
    params.require(:feed).permit(:title, :url)
  end
end

