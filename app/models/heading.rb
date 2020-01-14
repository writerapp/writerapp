class Heading < ApplicationRecord
  belongs_to :article
  has_many :subheadings, dependent: :destroy
  accepted_nested_attributes_for :subheadings, allow_destroy: true

end
