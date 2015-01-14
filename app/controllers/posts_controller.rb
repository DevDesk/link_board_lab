class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index       #by default always assumes render to view defined by def so this line unnecessary
    # render 'main/index'   would still show in url as post/index but would display main/index
    #render like my Maps project. Login and stay on home page but with user specific info showing
  end

#   def new
#     # @user = current_user
#     # @post = Post.new
#   end

#   def create
#     @user = current_user
#     @post = @user.posts.new(post_params)
#   # @post = @user.posts.create(post_params)

#     if @post.save
#   # unless @post.errors.any?
#       flash[:success] = "Your post has been added"
#       redirect_to root_path
#     else
#       render 'new'
#     end
#   end

#   def post_params
#     params.require(:post).permit(:title,:link)
#   end

end