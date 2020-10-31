class User < ApplicationRecord
    has_one_attached :avatar
    has_many :articles, dependent: :destroy
    validates :username, presence: true, 
                        length:{minimum:3, maximum:25}, 
                        uniqueness:{case_sensitive: false}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        length:{ maximum:250}, 
                        uniqueness:{case_sensitive: false},
                        format: {with: VALID_EMAIL_REGEX}
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :gender, presence:true
    validates :phone_no, presence:true, format: {with: /[2-9]{2}\d{8}/, message: " must be 10 digit integer."}
    validates :zip_code, presence:true
    validates :description, presence:true, length:{minimum:10}
    PASSWORD_REQUIREMENTS =  /\A
        (?=.{8,}) #At least 8 character
        (?=.*\d) #At least 1 number
        (?=.[a-z]) # At least one lowercase
        (?=.[A-z]) # At least one uper case
        /x
    validates :password, format: {with: PASSWORD_REQUIREMENTS ,message: ' should be min 8 digit, contain uppercase, lowercase and at least one number'}, on: :create   # notice: 'At least 8 character \n At least 1 number \n At least one lowercase \n At least one uper case'
    validates :password, presence:false, on: :update        

    has_secure_password
    



    # validate :password_lower_case
    # validate :password_uppercase
    # validate :password_special_char
    # validate :password_contains_number

    # def password_uppercase
    #     return if !!password.match(/\p{Upper}/)
    #     errors.add :password, ' must contain at least 1 uppercase '
    # end

    # def password_lower_case
    #     return if !!password.match(/\p{Lower}/)
    #     errors.add :password, ' must contain at least 1 lowercase '
    # end

    # def password_special_char
    #     special = "?<>',?[]}{=-)(*&^%$#`~{}!"
    #     regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    #     return if password =~ regex
    #     errors.add :password, ' must contain special character'
    # end

    # def password_contains_number
    #     return if password.count("0-9") > 0
    #     errors.add :password, ' must contain at least one number'
    # end


end