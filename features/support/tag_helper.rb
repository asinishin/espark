module TagHelper
  
  def tag_id_by_name(tags, name)
    tg = tags.find { |tag| tag['Track Name'] == name }
    tg['Track ID'] unless tg.nil?
  end

end

World(TagHelper)