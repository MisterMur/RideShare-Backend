class Forum < ApplicationRecord
  has_many :messages, :inverse_of => :forum
  has_many :users, through: :messages
end
