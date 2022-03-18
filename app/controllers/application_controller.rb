class ApplicationController < ActionController::API
  include AuthenticableUser 

  before_action :decode_header_token
end
