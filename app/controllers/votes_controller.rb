class VotesController < ApplicationController
  before_action :current_user, only: %i[create destroy]
  before_action :authenticate_user!
  before_action :find_article

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @vote = @current_user.votes.new(article_id: params[:article_id])
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
    respond_to do |format|
      format.html { redirect_back fallback_location: @vote, notice: 'Unvoted.' }
      format.json { head :no_content }
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :article_id, :status)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

  def already_liked?
    return true if Vote.find_by(user: @current_user, article: @article)
  end

  def find_like
    @like = @article.votes.find(params[:id])
  end
end
