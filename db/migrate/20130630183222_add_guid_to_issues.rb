class AddGuidToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :guid, :string
    add_index :issues, :guid
  end
end
