require 'globals'

class Tag < ActiveRecord::Base
  attr_accessible :name, :tag_id

  before_create :normalize
  validates_presence_of   :name, :tag_id
  validates_uniqueness_of :name
  validates_uniqueness_of :tag_id

  def self.search_by_example(name_example)
    where("name ilike '#{name_example}%'").order('name').first(8)
  end

  # TODO: Later it might be needed
  def self.clear_cache
  end

  def normalize
    self.name = self.name.first(Globals::TAG_NAME_LENGTH).downcase
  end
end
