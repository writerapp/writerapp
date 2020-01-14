class ChangeColumnToSubsubheading < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
  	change_column :subsubheadings, :title, :string, null: false
  end

  # 変更前の状態
  def down
  	change_column :subsubheadings, :title, :string, null: true
  end
end
