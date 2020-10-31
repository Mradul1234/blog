class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:show,:edit, :update]
    before_action :require_same_user, only: [:show, :edit, :update, :destroy]
    before_action :already_login, only: [:new]
    before_action :if_admin?, only: [:index]

    def show
        
        @articles = @user.articles.paginate(page: params[:page], per_page: 3).order(created_at: :desc)
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 4).order(created_at: :desc)
    end
    
    def new
        @user = User.new

    end

    def create

        @user = User.new(user_params)
            
        respond_to do |format|
          if @user.save
            flash[:success] = "User's Account is successfully created"
            format.js {redirect_to login_path}
            # format.json { render :show, status: :created, location: @user }
          else
            format.js #{render 'newfaulty.js.erb'}
            # format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end
        
        # respond_to do |format|
        #   if @user.save
        #     format.js {redirect_to login_path ,notice: "User's Account is successfully created"}
        #     format.html { redirect_to @user, notice: 'User was successfully created.' }
        #     format.json { render :show, status: :created, location: @user }
        #   else
        #     format.js  
        #     @user.errors.any?
        #     @user.errors.each do |key, value|
        #     end
        #   end
        # end
            # if @user.save
            #     flash[:notice] = "User's Account is successfully created"
            #     redirect_to login_path #,notice: "User's Account is successfully created"
            # else
            #     # format.js {render :new}
            #     render 'new'

            # end
        
    

    def edit
        
    end

    def update
        
        if @user.update(user_params)
            flash[:success] = "successfully update"
            redirect_to @user
        else
            render 'edit'
        end
    end


    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:success] = "Account and all associated articles successfully deleted"
        redirect_to articles_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :gender, :phone_no, :zip_code, :description, :password, :avatar)
    end

    def set_user
        @user = User.find(params[:id])
       
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
          flash[:danger] = "You can only view, edit or delete your own account"
          redirect_to @user
        end
    end
end

