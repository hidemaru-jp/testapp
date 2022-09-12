class FavoritesController < ApplicationController
  
  def create
    image = Image.find(params[:image_id])
    favorite = current_user.favorites.new(image_id: image.id)
    favorite.save
    redirect_to image_path(image)
  end
  
  def destroy
    image = Image.find(params[:image_id])
    favorite = current_user.favorites.find_by(image_id: image.id)
    favorite.destroy
    redirect_to image_path(image)
  end
  
end
