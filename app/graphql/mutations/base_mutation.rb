module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    include HandleErrors
    include AuthenticableUser

    def self.authorized?(object, context)
      unless context[:current_user]
        raise GraphQL::ExecutionError.new("Unauthorized error", options: { status: :unauthorized, code: 401 })
      end

      super && context[:current_user]
    end
  end
end
