class ChaptersController < ApplicationController

  before_action :set_novel
  #before_action :set_chapter, only: [:edit, :update, :destroy]

  def index
    @chapters = @novel.find_public_chapters
  end

  #we only want to show a published chapter to viewers
  def show
    @chapter = @novel.find_public_chapter(params[:chapters])
    if !@chapter
      redirect_to novel_path(@novel.code)
    end
  end

  def new
    @chapter = @novel.chapters.build
  end

  def create
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      redirect_to novel_chapter_path(@novel.code, @chapter.chapter_number)
    else
      render :new
    end
  end

  def edit
    @chapter = @novel.find_public_chapter(params[:chapters])
  end

  def update
    @chapter = @novel.find_public_chapter(params[:chapters])
    if @chapter.update(chapter_params)
      redirect_to novel_chapter_path(@novel.code, @chapter.chapter_number)
    else
      render :edit
    end
  end


  private

  def set_novel
    @novel = Novel.find_by(code: params[:novel_slug])
  end

  def set_chapter
    @chapter = @novel.chapters.where(chapter_number: params[:chapters]) if @novel
  end

  def chapter_params
    params.require(:chapter).permit(
      :title,
      :content,
      :chapter_number,
      :status,
      :language,
      :publish_date,
      :novel_id
    )
  end
end
