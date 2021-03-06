class ShortenedUrlsController < ApplicationController
  
  before_action :find_url, only: [:show, :shortened]
  skip_before_action :verify_authenticity_token

  #index action used like standard new action
  def index
    @url = ShortenedUrl.new
  end

  def show
    if @url.nil?
      redirect_to root_path
      flash[:notice] = "URL is not in the database"
    else
      redirect_to @url.original_url
    end
  end

  #complex create action possible worth to split
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

  def shortened
    host = "http://localhost:3000"
    @original_url = @url.original_url
    @short_url = host + '/' + @url.short_url
  end

  private

  def find_url
    @url = ShortenedUrl.find_by_short_url(params[:short_url])
  end

end
