class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :company_type
      t.attachment :company_image
      t.string :phone_number
      t.string :address
      t.string :country
      t.string :founded
      t.string :spokesman
      t.string :website
      t.references :user
      t.timestamps
    end
  end
end
