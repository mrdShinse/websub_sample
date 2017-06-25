class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[index]
  def feed
    @posts = Post.where(user_id: params[:user_id])
                 .order(created_at: :desc)
    respond_to do |format|
      format.html
      format.atom
    end
  end
end
