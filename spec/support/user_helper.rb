module UserHelper
  def authorization(user_id)
    "Basic " + ::JwtAuthenticator.encode(user_id: user_id)
  end
end
