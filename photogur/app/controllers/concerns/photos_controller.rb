class PhotosController < ApplicationController

	def index
      @photos = Photo.all
	end

	def new
	  @photo = Photo.new
	end

	def create
	  @photo = Photo.new(protect_my_params)
	  # Manual assignment of hash to phot attributes
	  # @photo.title = params[:photo][:title]
	  # @photo.artist = params[:photo][:artist]
	  # @photo.url = params[:photo][:url]
	  if @photo.save
	  	redirect_to photos_path
	  else 
	  	render :new
	  end
	end

	def edit
      @photo = Photo.find(params[:id])
	end

	def update
      @photo = Photo.find(params[:id])
      if @photo.update(protect_my_params)   #(params[:photo])
      	redirect_to photos_path
      else
      	render :edit
      end 
	end

	private

    #protecting or validating what was sent through the hash if doing mass assignment
	def protect_my_params
      return params.require(:photo).permit(:title, :artist, :url)
	end

end