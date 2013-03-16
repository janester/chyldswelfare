class CreateApplicationsTable < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :tagline
      t.string :bio
      t.string :image
      t.integer :age
      t.integer :user_id
      t.timestamps
    end
  end
end
