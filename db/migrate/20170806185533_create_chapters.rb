class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.integer :novel_id
      t.string :title
      t.string :content
      t.string :language, default: 'en'
      t.integer :chapter_number
      t.string :status, default: 'unpublished'
      t.datetime :publish_date
      t.timestamps
    end
  end
end
