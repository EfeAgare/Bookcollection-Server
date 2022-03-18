require 'rails_helper'

module Mutations
  module Users
    RSpec.describe RegisterUser, type: :request do
      describe '.resolve' do
        it 'register a user' do
          
          expect do
            post '/graphql', params: { query: mutation }
          end.to change { User.count }.by(1)
        end

        it 'returns a user' do
          post '/graphql', params: { query: mutation }
          json = JSON.parse(response.body)
          data = json['data']['registerUser']

          expect(data).to include(
            "firstName" => "Efe",
            "lastName" => "Efff",
            "email" => "love3@gmail.com",
             "token" => be_present,
          )
        end
      end

      def mutation
        <<~GQL
          mutation {
            registerUser(input: {
              firstName: "Efe",
              lastName: "Efff",
              password:  "password",
              email:"love3@gmail.com"
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