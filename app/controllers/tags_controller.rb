class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(category: params[:id].capitalize)
    @blogs = @tag.blogs.paginate(page: params[:page], :per_page => 5 )
  end
end
