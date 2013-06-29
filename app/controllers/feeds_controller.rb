class FeedsController < ApplicationController
  def index
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
 
private
  def post_params
    params.require(:feed).permit(:title, :url)
  end
end
