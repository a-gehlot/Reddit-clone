class CreateSubs < ActiveRecord::Migration[6.0]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description, null: false
      
      t.belongs_to :moderator, index: true

      t.timestamps
    end
  end
end
