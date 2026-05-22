class Expense < ApplicationRecord
  belongs_to :employee, optional: true

  STATUSES = %w[submitted approved reimbursed rejected].freeze

  validates :category, presence: true
end
