class Users::RegistrationsController < Devise::RegistrationsController
  require 'constant_message'
  
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if register_success then
      resource.persisted
    else
    register_failed
  end

  def register_success
    render json: { message: SUCCESS_MESSAGE_REGISTRATION }
  end

  def register_failed
    render json: { message: FAILED_MESSAGE_REGISTRATION }
  end
end