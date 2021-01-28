class RemoveIndex < ActiveRecord::Migration[6.0]
  def change
    remove_index :votes, column: [:user_id, :votable_id]
  end
end
