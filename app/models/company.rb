class Company < ApplicationRecord
  has_many :jobs
  has_many :contacts, through: :jobs
  accepts_nested_attributes_for :contacts

  has_attached_file :company_image
  validates_attachment :company_image,
                       content_type: { content_type: /\Aimage\/.*\z/ },
                       size: { less_than: 1.megabyte }
end
