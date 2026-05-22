class Lead < ApplicationRecord
  STATUSES = %w[new contacted qualified won lost].freeze
  SOURCES = %w[referral website event cold_call partner].freeze

  validates :company_name, presence: true
end
