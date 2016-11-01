class TagsController < ApplicationController

  def show
    @tags = Tag.find_by(name: params[:id])
  end

end
