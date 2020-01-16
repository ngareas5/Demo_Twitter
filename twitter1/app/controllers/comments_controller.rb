class CommentsController < ApplicationController
	
   
 def index
    @comment = @tweet.comments.order(created_at: :desc)
  end
   def create
    #binding.pry
    @tweet = Tweet.find(params[:tweet_id])
    @comment =@tweet.comments.create(comment_params.merge(user_id: @tweet.user_id))
   # @comment.save
    redirect_to tweet_path(@tweet)
  end
   def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.find(params[:id])
    @comment.destroy
    redirect_to tweet_path(@tweet)
  end


  private
    def comment_params
      params.require(:comment).permit(:comment,:user_id)
    end
end

