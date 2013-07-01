class RemoveBodyFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :body, :string
  end
end
