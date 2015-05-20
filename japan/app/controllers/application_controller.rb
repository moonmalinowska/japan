class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :tag_cloud
  before_filter :search


  def tag_cloud
    @tags = Attraction.tag_counts_on(:tags).order('count desc').limit(20)
  end

  def index
    @attractions = ActsAsTaggableOn::Attraction.all
  end


  def set_attr
   # @attractions ||= Attraction.all
  end

  def search
    @attractions ||= Attraction.all
    if params[:q].nil?
      @attractions = []
    else
      @attractions = Attraction.search params[:q]
    end
  end
end
