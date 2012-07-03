require 'net/http'
require 'globals'

class Batch < ActiveRecord::Base
  attr_accessible :example

  before_create :normalize

  def load
    unless self.example.nil?
      term = URI.escape(self.example)
      uri = URI.parse("http://itunes.apple.com/search?term=#{term}&country=us&entity=software")
      json = Net::HTTP.get(uri)
      Product.fill_tag_cache(Product.build_from_json(json))
    end
  end

  def normalize
    self.example = self.example.first(Globals::TAG_NAME_LENGTH).downcase
  end
end
