class CreateSubheadings < ActiveRecord::Migration[5.2]
  def change
    create_table :subheadings do |t|
      t.references :heading, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
