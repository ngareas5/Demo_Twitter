class RegistrationsController < Devise::RegistrationsController
def new
  @user=User.new
end

  # def create
  #   @user = User.new(sign_up_params)
  #   if @user.save
  #     binding.pry
  #     UserMailer.signup_confirmation.deliver
  #     redirect_to @user, notice: "User was successfully created."
  #   else
  #     render :new
  # end
#end
  private
    def sign_up_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation,:avatar)
     end
   def account_update_params
     params.require(:user).permit(:name ,  :username, :email, :password, :password_confirmation, :current_password,:avatar)
    end

end