require 'elasticsearch/model'

class Feed < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user

  settings do
    mappings dynamic: false do
      indexes :content, type: :text, analyzer: :english
    end
  end
end
