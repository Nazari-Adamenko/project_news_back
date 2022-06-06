class MembersController < ApplicationController
  # require ConstantsMessage

  before_action :authenticate_user!
  
  def show
    render json: { message: ConstantMessage::MESSAGE_MEMBER }
  end
end