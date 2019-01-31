class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Bienvenido a la aplicación!"
      log_in user
      redirect_to users_path
    else
      flash[:danger] = 'Email y/o contraseña invalidos'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
