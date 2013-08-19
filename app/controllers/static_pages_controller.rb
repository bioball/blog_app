class StaticPagesController < ApplicationController
  def home
    @blogs = User.find(1).blogs.paginate(page: params[:page], :per_page => 5 )
  end

  def contact
  end
end
