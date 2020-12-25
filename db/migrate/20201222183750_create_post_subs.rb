class CreatePostSubs < ActiveRecord::Migration[6.0]
  def change
    create_table :post_subs do |t|
      t.string :post_id
      t.string :sub_id

      t.timestamps
    end

    add_index :post_subs, :post_id
    add_index :post_subs, :sub_id
  end
end
