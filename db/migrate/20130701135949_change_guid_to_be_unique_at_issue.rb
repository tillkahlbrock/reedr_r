class ChangeGuidToBeUniqueAtIssue < ActiveRecord::Migration
  def change
    remove_index :issues, :guid
    add_index :issues, :guid, :unique => true
  end
end
