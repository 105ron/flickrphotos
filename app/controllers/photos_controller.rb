class PhotosController < ApplicationController
	def index
		@photos = photos_urls('145316110@N05')
		
	end
end
