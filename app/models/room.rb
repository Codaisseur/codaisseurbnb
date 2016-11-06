class Room < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :themes
  has_many :photos

  has_many :bookings, dependent: :destroy
  has_many :guests, through: :bookings, source: :user

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bedroom_count, presence: true
  validates :bathroom_count, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
  validates :address, presence: true

  def bargain?
    price < 30
  end

  def available?(checkin, checkout)
    bookings.each do |booking|
      if (booking.starts_at <= checkout) && (booking.ends_at >= checkin)
        return false
      end
    end

    true
  end

  def current_and_future_bookings
    today = Date.today
    bookings.where("starts_at >= ? OR ends_at >= ?", today, today)
  end
end
