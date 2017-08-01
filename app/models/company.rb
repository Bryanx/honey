class Company < ApplicationRecord
  has_many :contacts, :inverse_of => :companies
  belongs_to :user
  accepts_nested_attributes_for :contacts
end
