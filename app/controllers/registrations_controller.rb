class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  :success_message = "Signed up sucessfully."
  :failed_message = "Something went wrong."

  private

  def respond_with(resource, _opts = {})
    if register_success then
      resource.persisted
    else
    register_failed
  end

  def register_success
    render json: { message: :success_message }
  end

  def register_failed
    render json: { message: :failed_message }
  end
end