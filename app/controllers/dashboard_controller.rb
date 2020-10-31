class DashboardController < ApplicationController
  require './app/pdfs/users_pdf'
  layout 'dashboard'
  before_action :require_user, only: [:index]
  before_action :if_admin?, only: [:index]
  def index
  	@users = User.all
  	@articles = Article.all
  	@groups = Group.all
  end

  def users
  	@users = User.all.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.pdf do 
        pdf = UsersPdf.new(@users)#Prawn::Document.new
        # pdf.text "hello world 2222"
        send_data pdf.render,filename:"users_list2.pdf",
        type: "application/pdf",
        disposition: "inline"
      end 
    end
  end

  def articles
  	@articles = Article.all.order(created_at: :desc)
  end

  def make_admin
    @user = User.find(params[:id])
    @user.admin = true
    @user.save
    flash[:success] = "#{@user.username} is now an Admin"
    redirect_to admin_users_path
  end

end
