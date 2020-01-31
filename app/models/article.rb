class Article < ApplicationRecord
  belongs_to :writer, optional: true
  has_many :headings, dependent: :destroy
  accepts_nested_attributes_for :headings, allow_destroy: true
  has_one :feedback, dependent: :destroy

  enum status: {edit_heading: 0, apply_heading: 1, edit: 2, apply: 3, complete: 4}
  validates :title, length: { maximum: 35, message: 'は35文字以内にしてください' }


  with_options on: :apply_heading do
    validates :title, presence: { message: "を埋めてください"}
    validates :reference_1, presence: { message: "を埋めてください"}
    validates :reference_2, presence: { message: "を埋めてください"}
    validates :reference_3, presence: { message: "を埋めてください"}
    validates :headings, presence: { message: "が1つもありません"}
    validate :heading_has_title?
    validate :subheading_has_title?
    validate :subsubheading_has_title?
  end

  with_options on: :apply do
    validate :heading_has_body?
    validate :subheading_has_body?
    validate :subsubheading_has_body?
  end

  def heading_has_title?
    self.headings.each do |heading|
      if heading.title.blank?
        return errors.add(:heading, "のtitleを埋めてください")
      end
    end
  end

  def subheading_has_title?
    self.headings.each do |heading|
      heading.subheadings.each do |subheading|
        if subheading.title.blank?
          return errors.add(:subheading, "のtitleを埋めてください")
        end
      end
    end
  end

  def subsubheading_has_title?
    self.headings.each do |heading|
      heading.subheadings.each do |subheading|
        subheading.subsubheadings.each do |subsubheading|
          if subsubheading.title.blank?
            return errors.add(:subsubheading, "のtitleを埋めてください")
          end
        end
      end
    end
  end

  def heading_has_body?
    self.headings.each do |heading|
      if heading.body.blank?
        return errors.add(:heading, "のbodyを埋めてください")
      end
    end
  end

  def subheading_has_body?
    self.headings.each do |heading|
      heading.subheadings.each do |subheading|
        if subheading.body.blank?
          return errors.add(:subheading, "のbodyを埋めてください")
        end
      end
    end
  end

  def subsubheading_has_body?
    self.headings.each do |heading|
      heading.subheadings.each do |subheading|
        subheading.subsubheadings.each do |subsubheading|
          if subsubheading.body.blank?
            return errors.add(:subsubheading, "のbodyを埋めてください")
          end
        end
      end
    end
  end

end
