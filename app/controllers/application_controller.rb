class ApplicationController < ActionController::Base
  def after_sign_up_path_for(resource)
    stored_location_for(resource) || new_post_path
  end
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || new_post_path
  end
end
