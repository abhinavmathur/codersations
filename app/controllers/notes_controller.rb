class NotesController < ApplicationController

  before_action :set_category, only: [:index, :new, :create]
  before_action :set_tutorial, only: [:index, :new, :create]
  before_action :set_info, only: [:index, :new, :create]
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = current_user.includes(:notes).all
  end

  def new
    @note = @info.notes.new
  end

  def create
    @note = @info.notes.create(note_params)
    @note.user = current_user
    @note.tutorial_id = @tutorial.id
    @note.category_id = @category.id
    if params[:note][:task].to_i == 1
      @note.task = true
    else
      @note.task = false
    end
    if @note.save
      flash[:success] = 'Your note was successfully created'
      redirect_to [@category, @tutorial, @info]
    else
      flash[:danger] = 'Your note was not created. Either the title or content were blank'
      redirect_to [@category, @tutorial, @info]
    end
  end

  def show

  end

  def edit

  end

  def update
    if @note.update(note_params)
      flash[:success] = 'Your note was successfully updated'
      redirect_to note_path(@note)
    else
      flash[:danger] = 'Your note was not updated'
      render :edit
    end
  end

  def destroy
    info = @note.info
    tut = info.tutorial
    cat = tut.category
    @note.destroy
    flash[:success] = 'Your note was deleted successfully'
    redirect_to category_tutorial_info_path(cat, tut, info)
  end

  private
  def note_params
    params.require(:note).permit(:title, :content, :task)
  end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_tutorial
    @tutorial = @category.tutorials.friendly.find(params[:tutorial_id])
  end

  def set_info
    @info = @tutorial.infos.friendly.find(params[:info_id])
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
