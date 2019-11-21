class ApplicationController < ActionController::API
    # -> lets check to see IF we have headers
     # -> is there a token
     # -> decode the token
     # -> send back user id

  def encode_token(payload)
    # byebug
   JWT.encode(payload, ENV['KEY'])
   # payload {user_id: 1}
   # => enaj.fewfwaf.dfadf
  end

  def decode_token
   # if headers -> let's decode it else return nil
   # JWT.decode()
   # no need to check if there are headers because of the begin rescue!!
   begin
     JWT.decode(auth_headers, ENV['KEY'])
   rescue
     nil
   end
  end

  def auth_headers
   # check for headers
   request.headers["Authorization"]
   # returns the JWT
  end

  def curr_user
   user_id = decode_token[0]["user_id"]
   User.find(user_id)
   # who is the current user maybe we don't need to authorize the route but it might be nice to know
   # who the user is to see whether or not they can validly access something
  end

  def logged_in
   # is there a curr_user
   !!curr_user
  end

  def authorized
   # if there is a curr_user meaning they've been correctly validated
   # allow them in our application
   # otherwise send an error
   byebug
   render json: {errors: 'Please log in'} unless logged_in
  end
end
