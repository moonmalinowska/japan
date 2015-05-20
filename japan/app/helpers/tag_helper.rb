module TagHelper

  @tags = Attraction.tag_counts_on(:tags)
  ActsAsTaggableOn.force_lowercase = true
end
