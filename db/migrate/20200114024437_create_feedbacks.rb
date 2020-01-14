class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.references :article, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
