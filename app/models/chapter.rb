class Chapter < ApplicationRecord
  belongs_to :novel

  #scopes (chainable class methods)
  default_scope { order(chapter_number: :desc)}
  scope :released, -> { where('publish_date <= ?', Date.today + 1)}
  scope :public, -> { where(status: "published")}
  scope :latest, -> { reorder(publish_date: :desc) }
  #languages
  scope :en, -> { where(language: "en") }

  def to_param
    chapter_number
  end

  def self.latest_chapters
    self.where("publish_date <= ?", Date.today + 1).where(status: "published", language: "en").order(:publish_date => :desc).limit(10)
  end

end
