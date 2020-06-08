class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to user_path(user)

    else
      flash.now[:danger] = 'Email ou senha inválida'
      render 'new'
    end
    
    end

    def destroy
      sign_out
      flash[:sucess] = 'Logout com sucesso!'
      redirect_to entrar_path
  end

end
