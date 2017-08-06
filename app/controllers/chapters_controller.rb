class ChaptersController < ApplicationController

  before_action :set_novel
  before_action :set_chapter, only: [:edit, :update, :destroy]

  def index
    @chapters = @novel.find_public_chapters
  end

  #we only want to show a published chapter to viewers
  def show
    @chapter = @novel.find_public_chapter(params[:chapter])
  end


  private

  def set_novel
    @novel = Novel.find_by(code: params[:novel_slug])
  end

  def set_chapter
    @chapter = @novel.chapters.where(chapter_number: params[:chapter]) if @novel
  end

  def chapter_params
    params.require(:chapter).permit(
      :title,
      :content,
      :chapter_number,
      :status,
      :language,
      :publish_date
    )
  end
end
