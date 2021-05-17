class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @article.likes.create(user_id: current_user.id)
      if @vote.save
        flash[:success] = 'You liked this'
      else
        flash[:warning] = 'Please, try again'
      end
    end
    
    redirect_back fallback_location: @vote
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    flash[:warning] = 'You no longer like this'
    redirect_back fallback_location: @vote
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :article_id, :status)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

  def already_liked?
    Vote.where(user_id: current_user.id, article_id:
    params[:article_id]).exists?
  end

  def find_like
    @like = @article.votes.find(params[:id])
 end
end
