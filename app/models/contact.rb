class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :company, :inverse_of => :contacts
end
