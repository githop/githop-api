class CreateParagraphs < ActiveRecord::Migration[5.0]
  def change
    create_table :paragraphs do |t|
      t.string :kind
      t.string :text
      t.integer :sort_order
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
