class ShortenedUrlsController < ApplicationController

  def index
    @url = ShortenedUrl.new
  end

end
