class Message < ApplicationRecord
  belongs_to :page
  has_one :response
end
