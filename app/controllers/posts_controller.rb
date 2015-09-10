class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]
  
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) 
    @post.user_id = @current_user.id
    if @post.save
      redirect_to posts_path
    end
  end
  
  def index
    @posts = Post.all
  end
  
  private
  
    def post_params
      params.require(:post).permit(:content)
    end
end
