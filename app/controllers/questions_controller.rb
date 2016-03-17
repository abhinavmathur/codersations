class QuestionsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_category, only: [:index, :new, :create]
  before_action :set_tutorial, only: [:index, :new, :create]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = @tutorial.questions.all
  end

  def new
    @question = @tutorial.questions.new
  end

  def create
    @question = @tutorial.questions.create(question_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:success] = 'Your question was successfully created !'
      redirect_to question_path(@question)
    else
      flash[:danger] = 'Your question was not created'
      render :new
    end
  end

  def show
    @comments = @question.comments.order('created_at ASC')
  end

  def edit
    @tutorial = @question.tutorial
  end

  def update
    if @question.update(question_params)
      flash[:success] = 'Your question was successfully updated !'
      redirect_to question_path(@question)
    else
      flash[:danger] = 'Your question was not updated'
      render :edit
    end
  end

  def destroy
    @question.destroy
  end

  private
  def question_params
    params.require(:question).permit(:title, :solved, :pinned, :content)
  end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_tutorial
    @tutorial = @category.tutorials.friendly.find(params[:tutorial_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
