class EpisodesController < ApplicationController
  def index
    @meta = "CG Anantomy | الدروس"
    if params[:tag]
      @episodes = Episode.tagged_with(params[:tag]).published
    else
      @episodes = Episode.published.order(id: :desc)
    end    
  end
  
  def show
    @episode = Episode.friendly.find(params[:id])
    @meta_title = @episode.title
    @comment = Comment.new
    @comments = @episode.comments
  end

  def destroy
    @episode = Episode.friendly.find(params[:id])
    if @episode.comments.destroy
      redirect_to @episode, notice: '0 تم حذف التعليق'
      else
        redirect_to @episode, alert: 'لا تملك صلاحة حذف هذا التعليق'
      end

  end



end
