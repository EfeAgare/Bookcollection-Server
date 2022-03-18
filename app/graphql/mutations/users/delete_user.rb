# frozen_string_literal: true

module Mutations
  module Users
    class DeleteUser < Mutations::BaseMutation
      field :message, String, null: false

      def resolve(**params)
        if current_user.present?
          current_user.destroy
          { message: "User deleted successfully" }
        else
          unprocessable_entity("Can't delete user")
        end
      end

      def current_user
        context[:current_user]
      end
    end
  end
end
