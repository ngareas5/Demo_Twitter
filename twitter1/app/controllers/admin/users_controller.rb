class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show,:destroy]

  def index 
#binding.pry
   @user=User.all
   end 
   def show
  
   end

   def destroy
      @user.destroy
      #binding.pry
     respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end

end
  private

    def set_user

      @user = User.find(params[:id])
      #binding.pry
    end
 # def tweet_params
 #      params.require(:user).permit(:id)
 #    end

end