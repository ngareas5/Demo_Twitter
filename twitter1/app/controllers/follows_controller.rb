class FollowsController < ApplicationController
 before_action :find_user

 def index
 end
  def create
    current_user.follow(@user)
    redirect_to @user
   end

def destroy
    current_user.unfollow(@user)
end
 def find_user
 	  
      @user = User.find(params[:id])
      binding.pry
    end
end
