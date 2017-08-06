class Chapter < ApplicationRecord
  belongs_to :novel

  def to_param
    chapter_number
  end

end
