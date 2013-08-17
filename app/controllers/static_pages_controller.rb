class StaticPagesController < ApplicationController
  def home
    @blogs = User.find(1).blogs.paginate(page: params[:page])
  end

  def contact
  end
end
