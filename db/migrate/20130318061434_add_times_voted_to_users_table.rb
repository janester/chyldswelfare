class AddTimesVotedToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :times_voted, :integer, :default => 0
  end
end
