class ShortenedUrlsController < ApplicationController

  def index
    @url = ShortenedUrl.new
  end

  def create
    @url = ShortenedUrl.new
    @url.original_url = params[:original_url]
    @url_actualy = @url.original_url
    @url_may_exist = ShortenedUrl.find_by_original_url(params[:original_url])
    if @url_may_exist.nil?
      if @url.save
        redirect_to shortened_path(@url.short_url)
        flash[:notice] = "URL is added to list"
      else
        flash[:error] = "URL is not added to list"
        render 'index'
      end
    else
      flash[:notice] = "The link is exist already"
      redirect_to shortened_path(@url_may_exist.short_url)
    end
  end

end
