class AddVotesToApplicationsTable < ActiveRecord::Migration
  def change
    add_column :applications, :votes, :integer, :default => 0
  end
end
