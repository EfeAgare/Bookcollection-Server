require 'rails_helper'

module Mutations
  module Users
    RSpec.describe DeleteUser, type: :request do
      include UserHelper

      describe '.resolve' do
        let(:user) { create(:user, first_name: "Efe",last_name: "Efff", password: "password", email: "love3@gmail.com") }
              
        context "when a user doesn't exist" do
           it 'return an error' do

            post graphql_path, params: { query: mutation }
            
            json = JSON.parse(response.body)
            data = json['errors'][0]

            expect(data).to include(
              {"message" => "Unauthorized error",
                "status"=>"unauthorized",
                "code"=>401
              })
          end
        end
       

        it 'returns a success message' do

          post graphql_path, params: { query: mutation },  headers: { "Authorization" => authorization(user.id) }

          json = JSON.parse(response.body)
          data = json['data']['deleteUser']

          expect(data).to include(
            "message" => "User deleted successfully",
          )
        end
      end

      def mutation
        <<~GQL
          mutation {
            deleteUser(input:{}) {
              message          
            }
          }
        GQL
      end
    end
  end
end
