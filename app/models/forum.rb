class Forum < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages
end
