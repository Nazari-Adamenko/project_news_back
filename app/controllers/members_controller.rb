class MembersController < ApplicationController

  before_action :authenticate_user!
  
  def show
    render json: { message: ConstantMessage::MESSAGE_MEMBER }
  end
end