class PhotosController < ApplicationController
  before_action :authenticate_user! # ログインしていないときはログイン画面へ
  def index
    @photos = Photo.all
  end

  def new
     if params[:back]
       @photo = Photo.new(photos_params)
     else
       @photo = Photo.new
     end
   end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id # user_idを代入する
    if @photo.save
      redirect_to photos_path, notice: "投稿しました"
    else
      render action: 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    end

    def update
      @photo = Photo.find(params[:id])

      if @photo.update(photo_params)
        redirect_to photos_path, notice: "更新しました"
      else
        render action: 'edit'
      end
    end

    def destroy
      @photo = Photo.find(params[:id])
      @photo.destroy
      redirect_to photos_path, notice: "削除しました"
    end

    private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
        params.require(:photo).permit(:content)
    end
end
