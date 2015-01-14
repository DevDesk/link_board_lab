class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index       #by default always assumes render to view defined by def so this line unnecessary
    # render 'main/index'   would still show in url as post/index but would display main/index
    #render like my Maps project. Login and stay on home page but with user specific info showing
  end

  def new
    @user = User.find_by_id(session[:user_id])
    @post = Post.new
  end

  def create

    if @user = User.find_by_id(session[:user_id])
      @post = @user.posts.new(post_params)
    # @post = @user.posts.create(post_params)

      @post.save
    # unless @post.errors.any?
      flash[:success] = "Your post has been added"
      redirect_to root_path
    else
      # @post = nil
      flash[:error] = "You must login to post"
      # render 'new'
      redirect_to login_path
    end
  end

  def post_params
    params.require(:post).permit(:title,:link)
  end

  def show
    @post = Post.find_by_id(params[:id])
    # return render :plain => "error no creature" unless @creature
    not_found unless @post

    # @search = Creature.find(params[:id]).name
    #     list = flickr.photos.search :text => @search, :sort => "relevance"
    # @results = list.map do |photo|
    #   FlickRaw.url_s(photo)
    # end
    # @response = RestClient.get 'http://www.reddit.com/search.json', {:params => {:q => @post.title, :limit => 10}}
    # @response_object = JSON.parse(@response)
    # @reddit_posts = @response_object['data']['children']
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)

    redirect_to "/posts/#{params[:id]}"
  end

  def destroy
    @post = Post.find_by_id(params[:id]).destroy
    redirect_to posts_path
  end

end