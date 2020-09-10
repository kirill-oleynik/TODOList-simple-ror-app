# frozen_string_literal: true

module API
  class AuthenticationController < ApiController
    skip_before_action :authenticate_request
    def authenticate
      command = AuthenticatedUser.call(**auth_params)
      render json: { token: command.reslt }, status: 201 if command.success?
      render json: { errors: command.errors }, status: 401
    end

    private

    def auth_params
      params.require(:user).require(:email, :password)
    end
  end
end
