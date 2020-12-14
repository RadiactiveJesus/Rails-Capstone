class YpagesController < ApplicationController

  def home
    @categories= Category.all
    main = params[:main]
    unless main.nil?
      @articles = Article.where(:category_id => main)
    else

     @articles = Article.all  
    end
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
