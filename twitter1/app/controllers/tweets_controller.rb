  class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update,:destroy,:like]
  before_action :authenticate_user! , except: [:index, :show]
  #respond_to :js,:html
  # GET /tweets
  # GET /tweets.json

 
  # def upvote
  #   @tweet.upvote_from current_user
  #   redirect_to root_path
  
  # end

  # def downvote
  #   @tweet.downvote_from current_user
  #   redirect_to root_path

  # end
   def like
    if !current_user.liked? @tweet
      @tweet.liked_by current_user
    elsif current_user.liked? @tweet
      @tweet.unliked_by current_user
   end
    respond_to do |format|
    format.html
    format.js
  end
  redirect_to root_path
end
  def index
    @tweets = Tweet.all.order("created_at DESC")
    @tweet = Tweet.new

  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    #@tweet = Tweet.new
    @tweet = current_user.tweets.build
    #binding.pry
    respond_to do |format|
    format.html
    format.js
   end
    render 'tweets/index'
      
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    #@tweet = Tweet.new(tweet_params)
    @tweet = current_user.tweets.build(tweet_params)
    respond_to do |format|
      if @tweet.save
        #UserMailer.signup_confirmation.deliver_now
        format.html { redirect_to root_path, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:tweet,:image,:user_id)
    end
end
