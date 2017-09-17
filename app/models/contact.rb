class Contact < ApplicationRecord
  validates :first_name, :last_name, :title, presence: true

end
