class Users::OmniauthController < Devise::OmniauthCallbacksController
	def facebook
		@user = User.find_for_facebook_auth(request.env["omniauth.auth"], current_user)
		if @user.persisted?
			sign_in(resource_name, resource)
			redirect_to user_path(id: @user), notice: "Your account was created successfully!"
		else
			session[:provider] = request.env["omniauth.auth"].provider
      session[:uid] = request.env["omniauth.auth"].uid
      @user.provider = request.env["omniauth.auth"].provider
      @user.uid = request.env["omniauth.auth"].uid
      render "users/registrations/new"
		end
	end
end
