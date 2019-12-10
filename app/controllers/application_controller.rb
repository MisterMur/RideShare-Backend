class ApplicationController < ActionController::API
    # -> lets check to see IF we have headers
     # -> is there a token
     # -> decode the token
     # -> send back user id

  def encode_token(payload)
   JWT.encode(payload, ENV['KEY'])
  end

  def decode_token
   # if headers -> let's decode it else return nil
   # JWT.decode()
   # no need to check if there are headers because of the begin rescue!!
   if auth_headers
     token= auth_headers.split(' ')[1]
     begin
       JWT.decode(token, ENV['KEY'],true,algorithm: "HS256")
     rescue JWT::DecodeError
       []
     end
   end
  end

  def auth_headers
   # check for headers
   request.headers["Authorization"]
   # returns the JWT
  end

  def curr_user
    # debugger
   user_id = decode_token[0]["user_id"]
   User.find(user_id)
   # byebug
   # who is the current user maybe we don't need to authorize the route but it might be nice to know
   # who the user is to see whether or not they can validly access something
  end

  def session_user
    decoded_hash=decode_token
    if !decoded_hash.empty?
      user_id=decoded_hash[0]['user_id']
      @user=User.find_by(id: user_id)
    else
      nil
    end
  end
      # code
  def logged_in
   # is there a curr_user
   !!session_user
  end

  def authorized
   # if there is a curr_user meaning they've been correctly validated
   # allow them in our application
   # otherwise send an error
   debugger
   render json: {errors: 'Please log in'} unless logged_in
  end

end
