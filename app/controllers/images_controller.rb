class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

# 投稿データの保存

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

  def index
    @images = Image.page(params[:page])
  end

  def show
    @image = Image.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to '/images'
  end
  
    # 投稿データのストロングパラメータ
  private

  def image_params
    params.require(:image).permit(:shop_name, :image, :caption)
  end

end
