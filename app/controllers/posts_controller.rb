class PostsController < ApplicationController
  def create
    current_user.posts << Post.create!(post_params)
    redirect_to root_path
  end

  def update
    @post.update!(post_params)
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
