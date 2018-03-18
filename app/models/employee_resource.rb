class EmployeeResource < ApplicationRecord
  validates :name, :url, presence: true
end
