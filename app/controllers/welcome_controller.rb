class WelcomeController < ApplicationController

  def home
    # @chapters = Novel.joins(:chapters).select('novels.title AS novel_title', 'chapters.*')
    query = <<-SQL
      SELECT c.title, c.chapter_number, c.publish_date, c.status, c.language, n.code AS novel_code, n.title AS novel_title
      FROM chapters AS c
      LEFT JOIN novels as n
      ON c.novel_id = n.id
      WHERE (c.publish_date <= "#{Date.today}")
      AND (c.status = 'published')
      AND (c.language = 'en')
      ORDER BY c.publish_date DESC
      LIMIT 6
    SQL

    @chapters = ActiveRecord::Base.connection.execute(query)
    @novels = Novel.limit(12)

  end
end
