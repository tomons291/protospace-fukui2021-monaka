class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permited_parameters, if: :devise_controller?

  private
   
  def basic_auth
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end
  end

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :affiliation, :position])
  end

 

end
