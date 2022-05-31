class Users :: SessionsController < Devise :: SessionsController
  response_to :json 

 private

  def response_with ( resource , _opts = {}) 
   render json: { message: 'Вы вошли в систему.' }, статус: :ok 
 end 

 def response_to_on_destroy log_out_success
    && return if current_user 

   log_out_failure 
 end 

 def log_out_success 
   render json: { сообщение: «Вы вышли из системы». }, статус: :ok 
 end 

 def log_out_failure 
   renderjson: {сообщение: "Хм, ничего не произошло."}, статус: :unauthorized 
 end 
end