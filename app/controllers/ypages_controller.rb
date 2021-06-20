class YpagesController < ApplicationController
  def home
    cate = params[:cate]

    @articles = if cate.nil?
                  Article.all

                else
                  Article.where(name: cate)

                end
    @categories = Category.all
  end

  def new; end

  def create; end

  def update; end

  def edit; end

  def destroy; end

  def index; end

  def show; end
end
