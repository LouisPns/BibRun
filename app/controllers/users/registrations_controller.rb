class Users::RegistrationsController < Devise::RegistrationsController

  private
   def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :age, :picture, :level, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :age, :picture, :level)
  end



  protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end


    def after_update_path_for(resource)
      me_path
    end

    def after_sign_in_path_for(resource)
      me_path
    end

    def after_sign_up_path_for(resource)
      edit_user_registration_path
    end
end
