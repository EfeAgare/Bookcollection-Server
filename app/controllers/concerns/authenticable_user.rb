# frozen_string_literal: true

module AuthenticableUser
  private

  def generate_token(user_id)
    JwtAuthenticator.encode(user_id: user_id)
  end

  # set Devise's current_user using decoded JWT instead of session
  def current_user
    @current_user ||= User.find_by(id: @current_user_id) if signed_in?
  end

  def decode_header_token
    @current_user_id = JwtAuthenticator.decode_header_token(request)
  end

  # check that authenticate_user has successfully returned @current_user_id (user is authenticated)
  def signed_in?
    @current_user_id.present?
  end
end
