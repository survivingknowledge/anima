class Novel < ApplicationRecord
  has_many :chapters

  def to_param
    code
  end

  def find_chapter(num)
    self.chapters.where(chapter_number: num, language: 'en')
  end

  def find_public_chapter(num)
    self.chapters.where("publish_date <= ?", Date.today).where(chapter_number: num, status: 'published', language: 'en')
  end

  #should only have 1 published chapter for a given chapter number
  def find_public_chapters
    self.chapters.where("publish_date <= ?", Date.today).where(status: 'published', language: 'en')
  end
end
