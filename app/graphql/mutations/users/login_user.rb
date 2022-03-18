# frozen_string_literal: true

module Mutations
  module Users
    class LoginUser < Mutations::BaseMutation
      description "Login a user"

      argument :email, String, required: true
      argument :password, String, required: true

      type Types::Models::UserType

      def self.authorized?(object, context)
        true
      end

      def resolve(**params)
        user = User.find_by(email: params[:email].downcase)

        if user.present? && user.valid_password?(params[:password])
          token = generate_token(user.id)
          user.serializable_hash.merge(token: token)
        else
          not_found("User not found or not registered yet")
        end
      end
    end
  end
end
