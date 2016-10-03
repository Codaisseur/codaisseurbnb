require 'rails_helper'

RSpec.describe User, type: :model do
  describe "association with room" do
    let(:user) { create :user }
    let!(:room) { create :room, user: user }

    it "has many rooms" do
      room1 = user.rooms.new(listing_name: "Wonderful")
      room2 = user.rooms.new(listing_name: "Extraordinary")

      expect(user.rooms).to include(room1)
      expect(user.rooms).to include(room2)
    end

    it "deletes associated rooms" do
      expect { user.destroy }.to change(Room, :count).by(-1)
    end
  end
end
