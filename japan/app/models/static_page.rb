
class StaticPage < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks



  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['name^10', 'description', 'tag']
                }
            },
            highlight: {
                pre_tags: ['<em>'],
                post_tags: ['</em>'],
                fields: {
                    name: {},
                    description: {},
                    tag: {}
                }
            }
        }
    )
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
      indexes :description, analyzer: 'english'
      indexes :tag, analyzer: 'english'
    end
  end


  # Delete the previous articles index in Elasticsearch
  Attraction.__elasticsearch__.client.indices.delete index: Attraction.index_name rescue nil

  # Create the new index with the new mapping
  Attraction.__elasticsearch__.client.indices.create \
  index: Attraction.index_name,
  body: { settings: Attraction.settings.to_hash, mappings: Attraction.mappings.to_hash }

  # Index all article records from the DB to Elasticsearch
  Attraction.import
end

