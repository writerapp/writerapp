class CreateSubsubheadings < ActiveRecord::Migration[5.2]
  def change
    create_table :subsubheadings do |t|
      t.references :subheading, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
