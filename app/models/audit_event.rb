class AuditEvent < ApplicationRecord
  belongs_to :user, optional: true

  scope :recent, -> { order(occurred_at: :desc) }
end
