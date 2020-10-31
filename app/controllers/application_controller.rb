class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning
    def home
    #   render html: 'Hello world!'
    end

    helper_method :current_user, :logged_in?

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end

    def require_user
        if !logged_in?
          flash[:danger] = "You must be logged in to perform that action"
          redirect_to login_path
        end
    end

    def already_login
        if logged_in?
          flash[:info] = "You already login .For signin must loggout first"
          redirect_to root_path
        end
    end

    def if_admin?
      if !current_user.admin?
        flash[:danger] = "Only admin can access this page"
        redirect_to root_path
      end

    end

    def current_ability
      @current_ability ||= Ability.new(current_user)
    end
  
end
