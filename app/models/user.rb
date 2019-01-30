class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # CallBack - convierte a minúsculas el atributo email antes de almacenar el registro
    before_save { self.email = email.downcase }

    # Validaciones campos del formulario de registro
    validates :name, presence: true,
                     length: { maximum: 40 }
    validates :surname, presence: true, 
                        length: { maximum: 40 }
    validates :identification, presence: true,
                               length: { maximum: 12 }
    validates :email, presence: true,
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    # validates :password_confirmation, presence: true, 
    #                                   length: { minimum: 8 }
    # Método para contraseñas seguras
    has_secure_password
    validates :password, presence: true, 
                         length: { minimum: 8 },
                         allow_nil: true
    
    # Relacionar atributo avatar del modelo User con la clase AvatarUserUploader
    mount_uploader :avatar, AvatarUserUploader
end
