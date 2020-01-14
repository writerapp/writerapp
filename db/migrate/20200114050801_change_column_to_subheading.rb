class ChangeColumnToSubheading < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
  	change_column :subheadings, :title, :string, null: false
  end

  # 変更前の状態
  def down
  	change_column :subheadings, :title, :string, null: true
  end
end
