module Types
  class MutationType < Types::BaseObject
    ## User Session
    field :register_user, mutation: Mutations::Users::RegisterUser
    field :login_user, mutation: Mutations::Users::LoginUser
    field :delete_user, mutation: Mutations::Users::DeleteUser
  end
end
