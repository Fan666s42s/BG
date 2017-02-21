class Store < ApplicationRecord
  has_many :badguests

  validates :store_name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :tax_ID, presence: true
  validates :tax_ID, uniqueness: true  

  has_secure_password validation: false
end