class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])

    checkin = Date.strptime(booking_params[:starts_at], "%d-%m-%Y")
    checkout = Date.strptime(booking_params[:ends_at], "%d-%m-%Y")

    if room.available?(checkin, checkout)
      total_price = total_price(checkin, checkout, booking_params[:price])
      @booking = current_user.bookings.create(booking_params.merge(room: room, total: total_price))

      redirect_to @booking.room, notice: "Thank you for booking!"
    else
      redirect_to room, notice: "Sorry! This listing is not available during the dates you requested."
    end
  end

  private

  def total_price(checkin, checkout, price)
    total_days = (checkout - checkin).to_i
    price.to_i * total_days
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :price)
  end
end
