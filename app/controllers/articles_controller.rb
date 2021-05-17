class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show destroy]
  before_action :authenticate_user!
  before_action :current_user

  def index
    cate = params[:cate]

    if !cate.nil?
      @articles = Article.where(:category_id => cate)

    else
      @articles = Article.all

    end
    @featured = Article.featured_article
    @categories = Category.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    @categories = Category.all
  end

  def create
    @user = User.find_by(params[:id])
    @article = @user.articles.build(article_params)
     if @article.save
      flash[:success] = 'Article Successfully created'
      redirect_to @article
    else
      render action: :new

    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
 end

  private

  # def set_article
  #   @article = Article.find(params[:id])
  # end

  def article_params
    params.require(:article).permit(:title,:text, :image, :category_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
