class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_path_for(resource)
        if resource.is_a?(Admin)
          admin_products_path 
        else
          super
        end
      end

    
    before_action :initialize_cart


    private
    
    def initialize_cart
      session[:cart] ||= {}
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:full_address, :province_id])
    end

    
end
