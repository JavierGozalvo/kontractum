module UsersHelper
	def avatar_for(user)
		if user.avatar?
			image_tag user.avatar.url
		else
			image_tag "default_avatar.png"
		end
	end
end