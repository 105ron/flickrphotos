module PhotosHelper

	def user_photos(user_id, photo_count = 40)
    photos = flickr.photos.search(:user_id => user_id, :per_page => photo_count)
    flickr_stream(photos)
  end
  
  def recent_flickr(photo_count = 40)
    photos = flickr.photos.getRecent(:per_page => photo_count)
    flickr_stream(photos)
  end

  def user_stream(photos, user_id, columns = 6, pic_size = "q")
    puts user_id
    photos = photos.map { |x|  { title: x.title,
        pic: "https://farm#{x.farm}.staticflickr.com/#{x.server}/#{user_id}_#{x.secret}_#{pic_size}.jpg", 
        link: "https://www.flickr.com/photos/#{x.owner}/#{user_id}" } }
    #photos = photos.in_groups_of(columns)
  end

  def flickr_stream(photos, columns = 8, pic_size = "q")
    photos = photos.map { |x|  { title: x.title,
        pic: "https://farm#{x.farm}.staticflickr.com/#{x.server}/#{x.id}_#{x.secret}_#{pic_size}.jpg", 
        link: "search?utf8=✓&user_id=#{x.owner}&commit=Search",
        #link: "https://www.flickr.com/photos/#{x.owner}/#{x.id}",
        user: "#{x.owner}" } }

    photos = photos.in_groups_of(columns)
  end


#http://www.pixellatedvisions.com/2009/04/06/integrating-flickr-into-your-rails-website 
#The below was from the above website above to add a sidebar using 'flickr_fu'
#But changed in this app to use FlickRaw

  #def flickr_photos(photos, columns = 8, pic_size = "q")
   # begin
    #  puts photos.inspect
      #<%=flickr_photos('12864272@N02') %>
     # photos = photos.map { |x| { title: x.title,
     #  pic: "https://farm#{x.farm}.staticflickr.com/#{x.server}/#{x.id}_#{x.secret}_#{pic_size}.jpg", 
     #  link: "https://www.flickr.com/photos/#{x.owner}/#{x.id}" } }
      #photos = photos.in_groups_of(columns)
      #bug if odd number of pictures returned
      #render :partial => '/photos/sidebar_widget', :locals => { :photos => photos }
    #rescue Exception
      #render :partial => '/photos/unavailable'
    #  puts "needs rescue"
    #end
  #end

end
   # photos = photos.map { |x|  { title: x.title, pic: "https://farm#{x.farm}.staticflickr.com/#{x.server}/#{x.id}_#{x.secret}_#{pic_size}.jpg", link: "https://www.flickr.com/photos/#{x.owner}/#{x.id}", user: x.owner } }
