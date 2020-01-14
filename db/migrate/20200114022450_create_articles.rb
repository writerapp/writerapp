class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :writer, foreign_key: true
      t.string :keyword_1, null: false
      t.string :keyword_2, null: false
      t.string :keyword_3
      t.integer :status, null: false, default: 0
      t.string :title
      t.text :reference_1
      t.text :reference_2
      t.text :reference_3
      t.text :reference_4
      t.text :reference_5
      t.float :unit_price, null: false

      t.timestamps
    end
  end
end
