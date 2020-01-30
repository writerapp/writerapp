class Subsubheading < ApplicationRecord
  belongs_to :subheading

  validates :title, length: { maximum: 35, message: 'は35文字以内にしてください' }

end
