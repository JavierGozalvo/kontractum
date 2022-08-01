class ProfilesController < ApplicationController

	def edit
		
	end

	def update
		if current_user.update(profile_params)
			redirect_to root_path, notice: "Profile updated!"
		else
			render :edit
		end
	end


	private
	def profile_params
		params.require(:user).permit(:name, :surname, :city, :address, :postalcode)
	end

end