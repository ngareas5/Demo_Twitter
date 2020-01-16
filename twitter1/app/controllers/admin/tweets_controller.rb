class Admin::TweetsController < Admin::BaseController
   before_action :set_tweet, only: [:manage]
  def index
  	@tweets = Tweet.all.order("created_at DESC")
  	return @tweets
  end
  def manage
    @tweets = Tweet.all.order("created_at DESC")
  end
     def set_tweet
         binding.pry
        @tweet = Tweet.find(params[:id])
      end
 end