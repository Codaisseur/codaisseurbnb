require 'rails_helper'

describe "Viewing an individual room" do
  let(:user) { create :user }
  let(:room) { create :room, user: user }

  it "shows the room's details" do
    visit room_url(room)

    expect(page).to have_text(room.home_type)
    expect(page).to have_text(room.accommodate)
    expect(page).to have_text(room.bedroom_count)
    expect(page).to have_text(room.bathroom_count)
    expect(page).to have_text(room.listing_name)
    expect(page).to have_text(room.description)
    expect(page).to have_text(room.address)
  end
end
