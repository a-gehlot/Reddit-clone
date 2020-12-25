class ChangePostSubsKeysToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :post_subs, :post_id, 'integer USING CAST(post_id AS integer)'
    change_column :post_subs, :sub_id, 'integer USING CAST(sub_id AS integer)'
  end
end
