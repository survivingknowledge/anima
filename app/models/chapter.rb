class Chapter < ApplicationRecord
  belongs_to :novel

  #scopes (chainable class methods)
  default_scope { order(chapter_number: :desc)}
  scope :released, -> { where('publish_date <= ?', Date.today + 1)}
  scope :public_chapter, -> { where(status: "published")}
  scope :latest, -> { reorder(publish_date: :desc) }
  #languages
  scope :en, -> { where(language: "en") }

  def to_param
    chapter_number
  end

end
