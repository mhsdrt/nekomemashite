# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def guest_sign_in
    member = Member.guest
    sign_in member
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
    before_action :member_state, only: [:create]
  
  protected

  def member_state #論理削除された退会済みユーザーがログインできない
    @member = Member.find_by(email: params[:member][:email])
    return if !@member
    if @member.valid_password?(params[:member][:password]) && (@member.is_deleted == true)
    flash[:error] = "退会済みです。"
    redirect_to new_member_session_path
    end
  end
end
