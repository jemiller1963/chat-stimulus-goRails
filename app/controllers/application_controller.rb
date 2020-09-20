class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def root
    # if current_user.present?
      # redirect_to '/'
    # else
      # render template: 'home/index'
    # end
  # end

  protected

  
    def after_sign_in_path_for(resource)
      stored_location_for(resource) || notes_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :fname, :lname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :fname, :lname])
    end
end
