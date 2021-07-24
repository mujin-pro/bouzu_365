class ApplicationController < ActionController::Base
  before_action :configuire_permited_parameters, if: :devise_controller?

  def configuire_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      [:name, :mission])
  end
end
