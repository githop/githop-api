class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.date :posted_on

      t.timestamps
    end
  end
end
