class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article Created Successfully"
      redirect_to article_path(@article)
    else
      render :new
    end
  end
    
  def update
    if @article.update(article_params)
      flash[:success] = "Article Edited Successfully"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end
  
  def show
    @comment = Comment.new
  end
    
  def destroy
    @article.destroy
    flash[:danger] = "Article Deleted Successfully"
    redirect_to articles_path
  end
  
  private
    def find_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description, category_ids: [])
    end
  #Private (for my sanity when checking indents)
end