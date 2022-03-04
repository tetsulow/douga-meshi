class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後はトップページに遷移する
  def after_sign_in_path_for(resource)
    root_path
  end

  #ログアウト後はトップページに遷移する
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :is_deleted])
  end

end
