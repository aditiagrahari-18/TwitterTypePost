class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # def after_sign_up_path_for(resource)
  #   stored_location_for(resource) || new_post_path
  # end
  # def after_sign_in_path_for(resource)
  #   stored_location_for(resource) || new_post_path
  # end
  def logged_in_user
      unless user_signed_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :phone, :gender, :dob, :city])
 end
end
