class MembersController < ApplicationController
  require 'constant_message'

  before_action :authenticate_user!
  
  def show
    render json: { message: MESSAGE_MEMBER }
  end
end