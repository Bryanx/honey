class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :company, index: true
      t.timestamps
    end
  end
end
