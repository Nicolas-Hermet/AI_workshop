class Notification < ApplicationRecord
  belongs_to :user, optional: true

  scope :unread, -> { where(read: false) }
end
