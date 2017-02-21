class Badguest < ApplicationRecord
  belongs_to :store

  validates :phone, presence: true

  def self.countBG(phone)
    Badguest.where(phone: phone).length
  end
end