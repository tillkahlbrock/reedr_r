class AddSyncedWithDefaultValueToIssues < ActiveRecord::Migration
  def change
    change_table :issues do |t|
      t.remove :synced
      t.boolean :synced, :default => false
    end
  end
end
