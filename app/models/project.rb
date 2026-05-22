class Project < ApplicationRecord
  belongs_to :client, optional: true
  has_many :timesheets, dependent: :nullify

  STATUSES = %w[planned active on_hold delivered].freeze

  validates :name, presence: true
end
