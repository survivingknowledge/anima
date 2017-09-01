class Chapter < ApplicationRecord
  belongs_to :novel

  #scopes (chainable class methods)
  default_scope { order(chapter_number: :desc) }

  scope :released, -> { where('publish_date <= ?', Date.today + 1).where(status: "published") }
  scope :latest, -> { reorder(publish_date: :desc) }
  scope :find_ch, ->(num) { where('chapter_number = ?', num) if num.present? }
  #languages
  scope :lang, ->(lang = 'en') { where('language = ?', lang) }

  def to_param
    chapter_number
  end

end
