require 'net/http'
require 'globals'

class Batch < ActiveRecord::Base
  attr_accessible :example

  before_create :normalize

  def load
    unless self.example.nil?
      Product.fill_tag_cache(StoreApi.search_by_example(self.example))
    end
  end

  def normalize
    self.example = Tag.normalize_name(self.example)
  end
end
