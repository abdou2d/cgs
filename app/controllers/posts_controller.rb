class PostsController < ApplicationController
  def index
    @meta = "CG Anantomy | المدونة"
    @posts = Post.order(id: :desc)
  end

  def show
    @post = Post.friendly.find(params[:id])
    @meta_title = @post.title
  end
end
