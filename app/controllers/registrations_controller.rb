class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  _registrations_message = ["Signed up sucessfully.", "Something went wrong."]
  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: :_registrations_message[0] }
  end

  def register_failed
    render json: { message: :_registrations_message[1] }
  end
end