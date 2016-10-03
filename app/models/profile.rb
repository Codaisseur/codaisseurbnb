class Profile < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.by_letter(letter)
    where("first_name LIKE ?", "#{letter}%").order(:first_name)
  end
end
