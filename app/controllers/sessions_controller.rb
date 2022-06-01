class Users :: SessionsController < Devise :: SessionsController
  response_to :json 
  :response_message = "You are logged in."
  :success_message = "You are logged out."
  :failure_message = "Hmm nothing happened."

private

def response_with ( resource , _opts = {}) 
  render json: { message: :response_message }, status: :ok 
end 

def response_to_on_destroy 
  if log_out_success then 
    current_user 
    else
    log_out_failure
  end 
end 

def log_out_success 
  render json: { message: :success_message}, status: :ok 
end 

def log_out_failure 
    render json: {message: :failure_message}, status: :unauthorized 
  end 
end