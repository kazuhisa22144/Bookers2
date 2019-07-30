  class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end




  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end

Refile.secret_key = '660d0eefe94a2523a3c1cbcd3a6a6aa9fe1dd93d6702f7d45e98ddd3ba9ebf471812afa67fc5f72eb54fa28cfc5783e76dc32162ca27953cc64553d584eae3b5'