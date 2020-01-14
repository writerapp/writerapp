class Article < ApplicationRecord
  belongs_to :writer, optional: true
  has_many :headings, dependent: :destroy
  accepted_nested_attributes_for :headings, allow_destroy: true
  has_one :feedback, dependent: :destroy

  enum status: [:新規作成, :見出し編集中, :見出し承認待ち, :本文編集中, :本文承認待ち, :納品完了]
  validates :title, length: { maximum: 35, message: 'は35文字以内にしてください' }

end
