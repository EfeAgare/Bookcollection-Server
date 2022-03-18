module Types
  class MutationType < Types::BaseObject
    ## User Session
    field :register_user, mutation: Mutations::Users::RegisterUser
  end
end
