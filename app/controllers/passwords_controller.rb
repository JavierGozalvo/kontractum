class PasswordsController < ApplicationController
	before_action :require_user_logged_in!

	def edit
	end

	def update
		respond_to do |format|
      if current_user.update(password_params)
        format.html { redirect_to user_session_path, notice: "Password sucessfully updated!! Log again with new password!!" }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit, status: :unprocessable_entity, notice: "Passwords are not identical..." }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
	end

	private

	def password_params
		params.require(:user).permit(:password, :password_confirmation)
	end

end