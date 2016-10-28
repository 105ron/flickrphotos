class PhotosController < ApplicationController
	def index
		begin
			@photos = recent_flickr
		rescue
			render :partial => '/photos/unavailable'
		end
	end
end
