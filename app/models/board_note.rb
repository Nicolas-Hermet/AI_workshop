class BoardNote < ApplicationRecord
  validates :body, presence: true
end
