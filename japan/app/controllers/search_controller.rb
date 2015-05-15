class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @attractions = []
    else
      @attractions = Attraction.search params[:q]
    end
  end

end
