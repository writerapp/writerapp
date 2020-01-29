class Article < ApplicationRecord
  belongs_to :writer, optional: true
  has_many :headings, dependent: :destroy
  accepts_nested_attributes_for :headings, allow_destroy: true
  has_one :feedback, dependent: :destroy

  enum status: {edit_heading: 0, apply_heading: 1, edit: 2, apply: 3, complete: 4}
  validates :title, length: { maximum: 35, message: 'は35文字以内にしてください' }

end
