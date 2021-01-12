class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @featured = Article.featured_article
    @categories = Category.order(:priority).limit(5).includes(:articles)
  end

  def new
    @article = Article.new
  end

  def show
    @vote = current_user.votes.build
    @article = Article.find(params[:id])
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
    params.require(:article).permit(:title,:text, :category_id, :image)
  end

end
