# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
     unless @user.valid?
       render :new and return
     end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @user_detail = @user.build_user_detail
    render :new_user_detail
  end
 
  def create_user_detail
    @user = User.new(session["devise.regist_data"]["user"])
    @user_detail = UserDetail.new(user_detail_params)
     unless @user_detail.valid?
       render :new_user_detail and return
     end
    @user.build_user_detail(@user_detail.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  private

  def sign_up_params
    params.require(:user).permit(:nickname, :email, :password, :full_name, :full_name_kana, :prefecture_id, :phone_number)
  end

   
  def user_detail_params
    params.require(:user_detail).permit(:birthday, :household_id, :experience, :have_animal, :pet_friendly_id, :desired_animal, :economic_status, :deposit, :have_surgery_id, :get_vaccine_id, :indoor_outdoor, :visit_id, :consent_id, :remarks)
  end


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
