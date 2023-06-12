class Profile < ApplicationRecord
  belongs_to :user
  has_one :recommendation
end
