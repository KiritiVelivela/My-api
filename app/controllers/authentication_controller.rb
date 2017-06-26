class AuthenticationController < ApplicationController
  #skip_before_action :authorize_request, only: :authenticate
  # return auth token once user is authenticated
  def authenticate
    rol = Role.select(:name).where(id: User.select(:role_id).where(email: auth_params[:email]))
    auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(result: '0', auth_token: auth_token, role: rol )
  end

  private
  def auth_params
    params.permit(:email, :password)
  end
end
