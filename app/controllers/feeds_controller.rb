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
    @issues = []
    feed_reader = FeedReader.new
    issues = feed_reader.read(Feed.find(params[:id]))
    issues.each do |issue_data|
      @issues << Issue.create(issue_data) unless Issue.where(guid: issue_data[:guid]).exists?
    end
  end

  def transfer
    issues = Issue.where(:synced => false)
    @transfered = 0
    issues.each do |issue|
      if post_to_readability(issue)
        issue.synced = true
        issue.save
        @transfered += 1
      end
    end
  end

  def issues
    @issues = Issue.all
  end

private
  def post_params
    params.require(:feed).permit(:title, :url)
  end

  def post_to_readability(issue)
    true
  end
end

