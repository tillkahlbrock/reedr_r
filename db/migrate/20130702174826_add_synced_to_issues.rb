class AddSyncedToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :synced, :boolean
  end
end
