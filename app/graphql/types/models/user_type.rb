# frozen_string_literal: true

module Types
  module Models
    class UserType < ::Types::BaseObject
      field :id, ID, null: false
      field :email, String, null: false
      field :first_name, String, null: true
      field :last_name, String, null: true
      field :token, String, null: false
      field :date_of_birth, GraphQL::Types::ISO8601DateTime, null: true
    end
  end
end
