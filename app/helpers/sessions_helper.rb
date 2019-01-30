module SessionsHelper
    # Inicia sesión en el usuario
    def log_in(user)
        session[:user_id] = user.id
    end

    # Devuelve el usuario actual registrado, si lo hay
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # Devuelve True si el usuario ha iniciado sesión
    def logged_in?
        !current_user.nil?
    end

    # Cierra la sesión del usuario actual
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
