class Tag
  attr_accessor :tag_id, :name
  @@cache = nil
  
  def initialize(attrs=nil)
    super()
    unless attrs.nil?
      @tag_id   = attrs[:tag_id]
      @name     = attrs[:name].first(15).downcase
    end
  end
  
  def self.cache_outdated?
    @@cache.nil?
  end

  def self.cache_tags(data)
    unless data.nil?
      data.each do |item|
        new(
          yield item # getting hash of attributes
        ).save
      end
    end
  end
  
  def self.sort_all
    @@cache.sort_by { |tag_id, name| name } unless @@cache.nil?
  end
  
  def self.all
    sort_all.map { |tag| new(:tag_id => tag[0], :name => tag[1]) }
  end
  
  def self.search_by_example(name_example)
    sort_all.inject([]) do |items, tag|
      if tag[1].downcase.include?(name_example.downcase)
        items << new(:tag_id => tag[0], :name => tag[1])
      else
        items
      end
    end
  end

  def save
    @@cache ||= {}
    @@cache.merge!(self.tag_id => self.name)
    true
  end
end
