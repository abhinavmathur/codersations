class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_question, only: [:index, :new, :create]
  before_action :set_comment, only: [:destroy, :update, :edit]


  def index
    @comments = @question.comments.all
  end

  def new
    @comment = @question.comments.new

  end

  def create
    @comment = @question.comments.create(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'Your comment was successfully created'
      redirect_to question_path(@comment.question)
    else
      flash[:danger] = 'Your comment was not created'
      render :new
    end
  end

  def edit

  end

  def update
    if @comment.update(comments_params)
      flash[:success] = 'Your comment was successfully updated'
      redirect_to question_path(@comment.question)
    else
      flash[:danger] = 'Your comment was not updated'
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to question_path(@comment.question)
  end

  private
  def comments_params
    params.require(:comment).permit(:comment)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
