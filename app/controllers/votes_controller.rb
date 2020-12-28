class VotesController < ApplicationController
  def create
    @vote = current_user.votes.build(vote_params)
    if @vote.save
      flash[:success] = 'You liked this'
    else
      flash[:warning] = 'Please, try again'
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
end
