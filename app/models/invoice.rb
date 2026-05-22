class Invoice < ApplicationRecord
  belongs_to :mission

  STATUSES = %w[draft sent paid].freeze
  validates :status, inclusion: { in: STATUSES }
end
