class UsersController < ApplicationController
  # CallBack - restringe el acceso de usuarios no logueados
  before_action :logged_in_user, only: [:index, :edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Bienvenido a la aplicación!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Perfil actualizado"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuario eliminado"
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :surname, :identification, :avatar, :email, :password, :password_confirmation)
    end

     # Confirmar si un usuario esta logueado
     def logged_in_user
      unless logged_in?
        flash[:danger] = "Por favor, ingrese primero"
        redirect_to login_url
      end
    end
end
