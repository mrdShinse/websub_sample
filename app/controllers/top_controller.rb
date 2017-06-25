class TopController < ApplicationController
  def index
    @new_post = Post.new
    @my_posts = current_user.posts
  end
end
