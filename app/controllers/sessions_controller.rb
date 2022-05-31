class Users :: SessionsController < Devise :: SessionsController
  response_to :json 
  _sessions_message = ["You are logged in.", "You are logged out.", "Hmm nothing happened."]
private

def response_with ( resource , _opts = {}) 
  render json: { message: :_sessions_message[0] }, status: :ok 
end 

def response_to_on_destroy 
  if log_out_success then 
    return if current_user 
    else
    return log_out_failure
  end 
end 

def log_out_success 
  render json: { message: :_sessions_message[1]}, status: :ok 
end 

def log_out_failure 
  renderjson: {message: :_sessions_message[2]}, status: :unauthorized 
end 
end