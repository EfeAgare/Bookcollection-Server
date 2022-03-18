# frozen_string_literal: true

module Mutations
  module Users
    class RegisterUser < Mutations::BaseMutation
      extend ActiveSupport::Concern

      description "Register a user"

      argument :email, String, required: true
      argument :password, String, required: true
      argument :first_name, String, required: true
      argument :last_name, String, required: true

      type Types::Models::UserType

      def self.authorized?(object, context)
        true
      end

      def resolve(**attributes)
        user = User.find_by(email: attributes[:email].downcase)

        return conflict("User already exist") if user.present?

        new_user = User.new(attributes)

        if new_user.save
          token = generate_token(new_user.id)
          new_user.serializable_hash.merge(token: token)
        else
          unprocessable_entity(new_user.errors.full_messages)
        end
      end
    end
  end
end
