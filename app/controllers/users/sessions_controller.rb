class Users :: SessionsController < Devise :: SessionsController
  
  response_to :json 

private

def response_with ( resource , _opts = {}) 
  render json: { message: ConstantMessage::RESPONSE_MESSAGE_SESSION }, status: :ok 
end 

def response_to_on_destroy 
  if log_out_success then 
    current_user 
    else
    log_out_failure
  end 
end 

def log_out_success 
  render json: { message: ConstantMessage::SUCCESS_MESSAGE_SESSION}, status: :ok 
end 

def log_out_failure 
    render json: {message: ConstantMessage::FAILURE_MESSAGE_SESSION}, status: :unauthorized 
  end 
end