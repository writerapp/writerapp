class Subheading < ApplicationRecord
  belongs_to :heading
  has_many :subsubheadings, dependent: :destroy
  accepted_nested_attributes_for :subsubheadings, allow_destroy: true

end
