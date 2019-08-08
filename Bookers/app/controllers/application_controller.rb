  class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception



  def after_sign_up_path_for(resource)
      flash[:notice] = "Welcome! You have signed up successfully."
      user_path(current_user)
    end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Signed in successfully."
      user_path(current_user)
  end

  def after_sign_out_path_for(resource)
      flash[:notice] = "Signed out successfully."
      root_path
  end






  protected
 
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs

  end	
    protect_from_forgery with: :exception
  include SessionsHelper                                                         #SessionsHelper(メソッドの集合体)を全コントローラに適用

end