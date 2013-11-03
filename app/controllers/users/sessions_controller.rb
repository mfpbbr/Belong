class Users::SessionsController < Devise::SessionsController
	def create
		resource = warden.authenticate!(:scope => resource_name, :recall => "sessions#failure")
		sign_in(resource_name, resource)
		redirect_to user_path(id: resource)
	end

	def failure
		redirect_to new_user_session_path, alert: "Your email and password combination is incorrect."
	end

	def new
		@user = User.new
	end

	protected
		def after_sign_in_path_for(resource)
			user_path(resource)
		end

		def after_sign_out_path_for(resource)
			root_url
		end
end
