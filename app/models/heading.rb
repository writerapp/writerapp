class Heading < ApplicationRecord
  belongs_to :article
  has_many :subheadings, dependent: :destroy
  accepts_nested_attributes_for :subheadings, allow_destroy: true

  validates :title, length: { maximum: 35, message: 'は35文字以内にしてください' }


end
