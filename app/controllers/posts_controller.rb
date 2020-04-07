class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership, only: [:edit, :update, :destroy]
  # authenticate_user! 가 먼저 나와야 함. 왜냐하면 check_ownership에서 current_user를 사용하기 이전에 로그인 된 사용자만 사용이 가능하기 때문

  def index
    @posts = Post.all.order('created_at desc')
    @posts_count = current_user.posts.length # size, count 사용 가능
  end

  def new
  end

  def create
    new_post = Post.new(user_id: current_user.id,
                        content: params[:content],
                        image: params[:image])
    if new_post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def edit
    # @post = Post.find_by(id: params[:id])
  end

  def update
    # @post = Post.find_by(id: params[:id])
    # redirect_to root_path if @post.user_id != current_user.id

    @post.content = params[:content]

    if @post.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    # @post = Post.find_by(id: params[:id])
    # redirect_to root_path if @post.user_id != current_user.id

    @post.destroy
    redirect_to root_path
  end

  private

  def check_ownership
    @post = Post.find_by(id: params[:id])
    redirect_to root_path if @post.user_id != current_user.id
  end
end
