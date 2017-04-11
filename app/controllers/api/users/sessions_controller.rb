require Rails.root.join('lib/auth_token')

class Api::Users::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  respond_to :json

  def create
    email = auth_params[:email]
    password = auth_params[:password]

    @user = password_auth email, password if email && password

    if @user
      sign_in @user
      @auth_token = AuthToken.encode({ id: @user.id, class: 'User' })
      render :create, formats: [:json], status: :ok, location: nil
    else
      head :unauthorized
    end
  end

  def destroy
    sign_out current_user if current_user
    head :no_content
  end

  #############################################################################
  private
  def auth_params
    params.permit(:email, :password)
  end

  def password_auth email, password
    user = User.find_by_email email.downcase
    if user && user.valid_password?(password)
      return user
    else
      return nil
    end
  end
end
