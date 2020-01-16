class Admin::BaseController <ApplicationController
   
   before_action :ensure_admin_user!
  # before_action :authorize_admin
 

  def ensure_admin_user!
  	 if !(user_signed_in? and current_user.admin?)
        redirect_to user_session_path
    # elsif 
    # unless current_user and current_user.admin?
  	 #  redirect_to root_path
    end
 end

 
 
  



end