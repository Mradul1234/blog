class ResetsController < ApplicationController

	def edit

	end

	def update
	  user = User.find_by(email: params[:reset][:email])
      if params[:reset][:new] != params[:reset][:confirm] 
        flash[:danger] = "confirm and new password are not same"
        render 'edit'
      elsif user.password_digest == params[:reset][:old]
        user.password_digest = params[:reset][:new]
        user.save
        flash[:success] = "Password reset successfully"
        redirect_to login_path
      	# user.password_digest = params[:reset][:new] #BCrypt::Password.create(params[:reset][:new])
        


      else
       	flash[:danger] = "Password not reset"
	      redirect_to login_path
        # user.password_digest = BCrypt::Password.create(params[:reset][:new])
        
      # if user.save
	    #    	flash[:notice] = "Password reset successfully"
	    #     redirect_to login_path
	    # else
	    # 	flash[:notice] = "Password not reset"
	    #     redirect_to login_path
	    # end
       end
	end
end