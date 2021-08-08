class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :number])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :number])
      end
      protect_from_forgery with: :exception

      before_action :current_cart
    
      private
        def current_cart
          if session[:cart_id]
            cart = Cart.find_by(:id => session[:cart_id])
            if cart.present?
              @current_cart = cart
            else
              session[:cart_id] = nil
            end
          end
    
          if session[:cart_id] == nil
            @current_cart = Cart.create
            session[:cart_id] = @current_cart.id
          end
        end
    
end
