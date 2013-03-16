class CreateDonationsTable < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.decimal :amount
      t.date :date
      t.timestamps
    end
  end
end
