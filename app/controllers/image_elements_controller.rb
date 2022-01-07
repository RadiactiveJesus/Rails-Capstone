class ImageElementsController < ApplicationController
  def create
    @article = current_user.articles.find(params[:article_id])
    @article.image_elements.create
    redirect_to @article
  end

  def update
    @article = current_user.articles.find(params[:article_id])
    redirect_to @article
  end

  def image_element_params
    params.require(:image_element).permit(:image)
  end
end
