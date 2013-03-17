class ChangeBioColumnInApplicationsTable < ActiveRecord::Migration
  def change
    change_column :applications, :bio, :text
  end
end
