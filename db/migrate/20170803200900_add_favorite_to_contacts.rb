class AddFavoriteToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :favorite, :boolean
  end
end
