class Document < ApplicationRecord
  belongs_to :user, optional: true

  DOC_TYPES = %w[report memo presentation spec invoice_copy].freeze

  validates :title, presence: true
end
