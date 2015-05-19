class TagController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @attractions = Attraction.tagged_with(@tag.name)
  end
end
