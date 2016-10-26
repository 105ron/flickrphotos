# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
FlickRaw.api_key       = Figaro.env.API_KEY
FlickRaw.shared_secret = Figaro.env.SHARED_SECRET
flickr.access_token    = Figaro.env.ACCESS_TOKEN
flickr.access_secret   = Figaro.env.ACCESS_SECRET
