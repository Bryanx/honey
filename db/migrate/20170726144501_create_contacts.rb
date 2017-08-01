class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :org
      t.date :birthday
      t.string :website
      t.string :phone_number1
      t.string :phone_number2
      t.string :address
      t.string :notes
      t.references :user
      t.references :company
      t.timestamps
    end
  end
end
