class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :number])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :number])
      end
      # protect_from_forgery with: :exception

  def current_order 
    if current_user 
    order = Order.find_or_create_by(user_id: current_user.id, state: "created")
    end
  end


end
