class Api::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :forgot_password]
  before_action :authenticate_user!, only:[:update]
  respond_to :json

  def create
    @user = User.new(email: registration_params[:email], password: registration_params[:password])
    @user.build_profile_record(registration_params['profile_attributes'])

    if @user.save
      render :create, formats: [:json], status: :created, location: nil
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = authenticated_user
    @user.email = registration_params['email'] if registration_params['email'].present?
    @user.password = registration_params['password'] if registration_params['password'].present?

    profile_record = @user.profile_record
    profile_record.transaction do
      registration_params['profile_attributes'].each_pair do |key,val|
        profile_record.update_attributes(key => val)
      end
    end

    if @user.save
      render :profile, formats: [:json], status: :ok, location: nil
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def forgot_password
    @user = User.find_by(email: registration_params[:email].try(:downcase))
    unless @user.nil?
      @user.send_reset_password_instructions
      head :ok
    else
      head :unprocessable_entity
    end
  end

  #############################################################################
  private
  def registration_params
    params.permit(:id, :email, :password, profile_attributes: [:first_name, :last_name, :date_of_birth, :gender, :telephone, :terms_agreement, :avatar])
  end
end
