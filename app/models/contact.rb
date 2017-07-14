class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_one :address

  accepts_nested_attributes_for :address
end
