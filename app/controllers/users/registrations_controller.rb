class Users::RegistrationsController < Devise::RegistrationsController
	def new
		@user = User.new
	end

	def create
		resource = User.new(user_params)
    resource.provider = session[:provider]
    resource.uid = session[:uid]
    resource.first_name = resource.first_name.titleize
    resource.last_name = resource.last_name.titleize
    if resource.save
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        # respond_with resource, :location => after_sign_up_path_for(resource)
        redirect_to user_path(resource)
      else
        expire_session_data_after_sign_in!
        redirect_to root_path, error: "Activate your account"
      end
    else
      clean_up_passwords resource
      flash[:alert] = resource.errors.full_messages.join(', ')
      @user = resource
      render "users/registrations/new"
    end
	end

	private
		def user_params
	    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :updated_at, :created_at, :provider, :uid)
	  end
end
