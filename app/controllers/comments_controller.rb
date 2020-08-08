class CommentsController < ApplicationController
  before_action :set_episode
  before_action :authenticate_user!

  def create
    @comment = @episode.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    if @comment.errors.any?
      render partial: 'error', comment: @comment, status: :bad_request
    else
      render @comment
    end
  end

  def destroy
    @comment = @episode.comments.find(params[:id])
    @comment.destroy
    
  end


  
  private
    def comment_params
      params.require(:comment).permit(:body, :img, :episode_id)
    end

    def set_episode
      @episode = Episode.friendly.find(params[:episode_id])
    end
end
