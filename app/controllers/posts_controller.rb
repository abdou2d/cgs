class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :desc)
  end

  def show
    @post = Post.friendly.find(params[:id])
  end
end
