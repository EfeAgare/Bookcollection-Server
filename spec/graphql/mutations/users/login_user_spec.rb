require 'rails_helper'

module Mutations
  module Users
    RSpec.describe LoginUser, type: :request do
      describe '.resolve' do
        let(:user) { create(:user, first_name: "Efe",last_name: "Efff", password: "password", email: "love3@gmail.com") }
              
        context "when a user doesn't exist" do
           it 'return an error' do

            post '/graphql', params: { query: mutation("nouser@gmail.om", user.password) }
            
            json = JSON.parse(response.body)
            data = json['errors'][0]

            expect(data).to include(
              {"message"=>"User not found or not registered yet",
                "status"=>"not_found",
                "code"=>404
              })
          end
        end
       

        it 'returns a user after login' do

          post '/graphql', params: { query: mutation(user.email, user.password) }

          json = JSON.parse(response.body)
          data = json['data']['loginUser']

          expect(data).to include(
            "firstName" => user.first_name,
            "lastName" => user.last_name,
            "email" => user.email,
            "token" => be_present,
          )
        end
      end

      def mutation(email, password)
        <<~GQL
          mutation {
            loginUser(input: {
              email: "#{email}",
              password: "#{password}"
            }) {
              token
              lastName
              firstName  
              email            
            }
          }
        GQL
      end
    end
  end
end
