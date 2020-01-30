class Subheading < ApplicationRecord
  belongs_to :heading
  has_many :subsubheadings, dependent: :destroy
  accepts_nested_attributes_for :subsubheadings, allow_destroy: true

  validates :title, length: { maximum: 35, message: 'は35文字以内にしてください' }

end
