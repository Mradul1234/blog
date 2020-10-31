class SessionsController < ApplicationController

    def new
    end
  
    def create123
      user = User.find_by(email: params[:user][:email].downcase)
        respond_to do |format|
          if params[:user][:email].blank? && params[:user][:password].present?
            flash[:danger] = "Email address missing"
            format.js {render 'create123.js.erb'}
          elsif params[:user][:email].present? && params[:user][:password].blank?
            flash[:danger] = "Password missing"
            format.js {render 'create123.js.erb'}
          elsif params[:user][:email].blank? && params[:user][:password].blank?
            flash[:danger] ='Email address and password missing'
            format.js {render 'create123.js.erb'}
          elsif user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            flash[:success] = "Logged in successfully"
            if user.admin?
              format.js {redirect_to admin_path}
            else
              format.js {redirect_to root_path}
            end
          else
            flash.now[:danger] = "There was something wrong with your login details"
            format.js {render 'create123.js.erb'}
          end
        end
    end
  
    def destroy
      session[:user_id] = nil
      flash[:danger] = "Logged out"
      redirect_to login_path
    end
  
  end 