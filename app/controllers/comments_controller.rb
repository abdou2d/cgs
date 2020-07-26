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
    respond_to do |format|
      format.html { redirect_to @episode, notice: 'تم حذف التعليق' }
      format.json { head :no_content }
    end
  end


  
  private
    def comment_params
      params.require(:comment).permit(:body, :img, :episode_id)
    end

    def set_episode
      @episode = Episode.friendly.find(params[:episode_id])
    end
end
