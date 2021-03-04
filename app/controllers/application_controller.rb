# class ApplicationController < ActionController::Base
#   before_action :authenticate_user!, except: [:index, :show]
# end

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :age, :avatar_url, :city])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :first_name, :last_name, :age, :avatar_url, :city])
  end
end
