class Chapter < ApplicationRecord
  belongs_to :novel

  def to_param
    chapter_number
  end

  def self.latest_chapters
    self.where("publish_date <= ?", Date.today + 1).where(status: "published", language: "en").order(:publish_date => :desc).limit(10)
  end

end
