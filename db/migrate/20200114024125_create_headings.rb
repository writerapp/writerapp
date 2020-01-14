class CreateHeadings < ActiveRecord::Migration[5.2]
  def change
    create_table :headings do |t|
      t.references :article, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
