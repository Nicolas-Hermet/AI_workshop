class Contract < ApplicationRecord
  belongs_to :client, optional: true

  STATUSES = %w[draft active expired terminated].freeze

  validates :reference, presence: true
end
