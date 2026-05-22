class Timesheet < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :project, optional: true

  validates :hours, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
