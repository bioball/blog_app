class BlogsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :destroy]
  include SessionsHelper

  def new
    @blog = current_user.blogs.build
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = "Blog created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    flash[:notice] = "The blog titled '#{blog.title}' has been deleted."
    redirect_to root_url
  end

  private

    def blog_params
      params.require(:blog).permit(:title, :content)
    end

    def admin_user
      redirect_to root_url, notice: "Permission denied" unless current_user.admin?
    end
end
