class PhotosController < ApplicationController
	def index
		begin
			@photos = recent_flickr
		rescue
			render :partial => '/photos/unavailable'
		end
	end

	def show
		begin
			@photos = user_photos(params[:user_id])
		rescue
	  	render :partial => '/photos/unavailable'
		end
	end

end
