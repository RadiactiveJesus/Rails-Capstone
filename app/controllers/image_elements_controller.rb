class ImageElementsController < ApplicationController 
    def create 
        @article = current_user.articles.find(params[:article_id])
        @article.image_elements.create
        redirect_to @article
    end

    def update
        @article = current_user.articles.find(params[:article_id])
        image_element = article.image_elements.find(params[:id])
        if @image_element.image.attach(image_element_params[:image])
            redirect_to @article
        else
            redirect_to @article
        end
    end


    def image_element_params
        params.require(:image_element).permit(:image)
    end
end