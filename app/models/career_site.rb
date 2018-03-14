class CareerSite < ApplicationRecord
  validates :name, :url, presence: true
end
