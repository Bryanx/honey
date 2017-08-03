class Contact < ApplicationRecord
  searchkick word_start: [:first_name, :last_name]

  def search_data
    {
        first_name: first_name,
        last_name: last_name,
    }
  end

  has_many :jobs
  has_many :companies, through: :jobs
  belongs_to :user
  accepts_nested_attributes_for :companies, allow_destroy: true, :reject_if => proc { |att| att[:name].blank? }

  has_attached_file :contact_image
  validates_attachment :contact_image,
                       content_type: { content_type: /\Aimage\/.*\z/ },
                       size: { less_than: 1.megabyte }

end
