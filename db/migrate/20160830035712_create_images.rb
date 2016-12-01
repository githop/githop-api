class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :kind
      t.string :href
      t.string :title
      t.integer :sort_order
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
