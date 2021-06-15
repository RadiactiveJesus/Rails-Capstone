class YpagesController < ApplicationController

  def home
     
     cate = params[:cate]

    if !cate.nil?
      @articles = Article.where(:name => cate)

    else
      @articles = Article.all

    end
    @categories = Category.all
  end
  
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end
end
