class Users::SessionsController < Devise::SessionsController
  
  respond_to :json 

private

def respond_with ( resource , _opts = {})
  if current_user then render json: { message: current_user }, status: :ok
  else render json: { message: ConstantMessage::FAILURE_MESSAGE_SESION_LOGIN }, status: :unauthorized
  end
end

def respond_to_on_destroy 
  if current_user  then log_out_success
  else log_out_failure
  end 
end 

def log_out_success 
  render json: { message: ConstantMessage::SUCCESS_MESSAGE_SESSION}, status: :ok 
end 

def log_out_failure 
    render json: {message: ConstantMessage::FAILURE_MESSAGE_SESSION}, status: :unauthorized 
  end 
end