class Message < ApplicationRecord
  belongs_to :user
  belongs_to :forum,:inverse_of => :messages
end
