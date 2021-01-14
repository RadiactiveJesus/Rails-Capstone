class YpagesController < ApplicationController

  def home
    @categories= Category.all
    main = params[:main]
     @articles = Article.all  
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
