class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
    @article = Article.new
  end

  
  def show
  end

  def preview
    @articles = Article.only_deleted
  end

   
  def new
    @article = Article.new
  end

   
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    respond_to do |format|
      if @article.save
        flash[:success] = 'Article was successfully created.'
        format.html { redirect_to @article }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end
  
  def update
    
    respond_to do |format|
      if @article.update(article_params)
        flash[:success] = 'Article was successfully updated'
        format.html { redirect_to articles_path}
        format.js
         
      else
        format.html { render :edit }
        format.js
         
      end
    end
  end

   
  def destroy
    @article.destroy
    @articles = Article.all
    respond_to do |format|
      # flash.now[:success] = 'Article was successfully destroyed.'
      format.js
      format.html { redirect_to articles_url }
       
    end
  end

  private
     
    def set_article
      @article = Article.find(params[:id])
    end

     
    def article_params
      params.require(:article).permit(:title, :description)
    end

    def require_same_user
      if current_user != @article.user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own article"
        redirect_to @article
      end
    end
end
