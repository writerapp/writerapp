class Article < ApplicationRecord
  belongs_to :writer, optional: true
  has_many :headings, dependent: :destroy
  accepts_nested_attributes_for :headings, allow_destroy: true
  has_one :feedback, dependent: :destroy

  enum status: [:見出し作成中, :見出し申請中, :記事執筆中, :納品申請中, :納品完了]
  validates :title, length: { maximum: 35, message: 'は35文字以内にしてください' }

end
