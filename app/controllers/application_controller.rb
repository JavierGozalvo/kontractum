class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :doc_id, :doc_kind, :email, :birthdate, :address, :city, :postalcode])
  end

	def require_user_logged_in!
		redirect_to new_user_session_path, alert: "You must be logged in to do that!" if !user_signed_in?
	end

end
