class ChangeVoteTable < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :user_id, :integer, null: false
    change_column_null :votes, :value, false
    change_column_null :votes, :votable_id, false
    change_column_null :votes, :votable_type, false

    add_index :votes, [:user_id, :votable_id, :votable_id], unique: true
    add_index :votes, :user_id
  end
end
