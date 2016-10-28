module PhotosHelper

	def user_photos(user_id, photo_count = 12)
    photos = flickr.photos.search(:user_id => user_id, :per_page => photo_count)
  end
  
  def photos_urls(user_id, photo_count = 4)
    #begin
      photos = user_photos(user_id, photo_count)
      photos = photos.map { |pic| pic.id }
    #rescue Exception
     # photos = "crap"
    #end

  	urls = photos.map { |pic| FlickRaw.url_n(flickr.photos.getInfo(photo_id: pic)) }
  	urls = urls.in_groups_of(4)
  end


  
  def render_flickr_sidebar_widget(user_id, photo_count = 12, columns = 2)
    begin
      photos = user_photos(user_id)
      photos = photos.map { |x| { title: x.title,
        pic: "https://farm#{x.farm}.staticflickr.com/#{x.server}/#{x.id}_#{x.secret}_m.jpg", 
        link: "https://www.flickr.com/photos/#{user_id}/#{x.id}" } }
      photos = photos.in_groups_of(2)
      #bug if odd number of pictures returned
      render :partial => '/photos/sidebar_widget', :locals => { :photos => photos }
    rescue Exception
      render :partial => '/photos/unavailable'
    end
  end
end