class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  private
    #sign in後のredirect先変更
    def after_sign_in_path_for(resource)
        case resource
        when Admin
           admin_top_path
        when EndUser
            end_user_path(resource)
        else
           super
        end
    end

    #sign out後のredirect先変更
    def after_sign_out_path_for(resource)
        case resource
            when Admin, :admin, :admins
              new_admin_session_path
            when EndUser, :EndUser, :end_users
              root_path
            else
              super
            end
    end

    #sin up時の登録情報追加
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :street_address, :post_code, :phone_number])
    end
end
