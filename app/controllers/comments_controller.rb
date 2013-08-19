class CommentsController < ApplicationController
  before_action :signed_in_user

  def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment has been posted"
      redirect_to blog_path(@blog)
    else
      redirect_to blog_path(@blog)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment
      comment.destroy
      flash[:notice] = "Comment has been deleted"
      redirect_to blog_path(comment.blog_id)
    else
      redirect_to blog_path(comment.blog_id)
    end
  end

  private
    def signed_in_user
      redirect_to root_url, notice: "Please sign in" unless signed_in?
    end

    def comment_params
      params.require(:comment).permit(:user_id, :content)
    end
end
