class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(params[:id])
    @room = @photo.room

    @photo.destroy!
    @photos = Photo.where(room_id: @room.id)

    respond_to do |format|
      format.html { redirect_to room_path(@room) }
      format.js # render songs/create.js.erb
    end
  end
end
