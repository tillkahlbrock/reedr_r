class MakeGuidPkForIssues < ActiveRecord::Migration
  def change
    drop_table :issues

    create_table :issues, :id => false do |t|
      t.string :guid, :null => false, :unique => true
      t.string :title

      t.references :feed, index: true

      t.timestamps
    end
  end
end
