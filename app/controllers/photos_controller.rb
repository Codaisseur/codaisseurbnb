class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(params[:id])
    @room = @photo.room

    @photo.destroy

    redirect_to edit_room_path(@room), notice: "Photo successfully removed"
  end
end
