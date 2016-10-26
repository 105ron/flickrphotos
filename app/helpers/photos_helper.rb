module PhotosHelper

	def user_photos(user_id, photo_count = 4)
    photos = flickr.photos.search(:user_id => user_id, :per_page => photo_count)
    photos = photos.map { |pic| pic.id }
  end
  
  def photos_urls(user_id, photo_count = 4)
    #begin
      photos = user_photos(user_id, photo_count)
    #rescue Exception
     # photos = "crap"
    #end

  	urls = photos.map { |pic| FlickRaw.url_n(flickr.photos.getInfo(photo_id: pic)) }
  	urls = urls.in_groups_of(4)
  end
end
#FlickRaw.url_o(flickr.photos.getInfo(photo_id: photo_id)