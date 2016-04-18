class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_question, only: [:index, :new, :create]
  before_action :set_comment, only: [:destroy, :update, :edit]


  def index
    @comments = @question.comments.order('created_at DESC')
  end

  def new
    @comment = @question.comments.new
  end

  def create
    @comment = @question.comments.create(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      user_id_arr = [];
      @question.comments.each do |user|
        user_id_arr.push(user.user_id)
      end
      user_id_arr.delete(current_user.id)
      user_id_arr.uniq.each do |user|
        user = User.find_by(id: user)
        Notification.create(recipient: user, actor: current_user, action: 'posted', notifiable: @comment)
      end
      respond_to do |format|
        format.html {
          flash[:success] = 'Your comment was successfully created'
          redirect_to question_path(@comment.question)
        }
        format.js
      end
    else
      flash[:danger] = 'Your comment was not created. The comment body was missing.'
      redirect_to question_path(@comment.question)
    end
  end

  def edit

  end

  def update
    if @comment.update(comments_params)
      flash[:success] = 'Your comment was successfully updated'
      redirect_to question_path(@comment.question)
    else
      @comment.errors.full_messages.each do |error|
        flash[:danger] = error.to_s
      end
      render :edit
    end
  end

  def destroy
    question = @comment.question
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to question_path(question) }
      format.js
    end
  end

  def upvote
    @comment = Comment.find_by(id: params[:comment].to_i)
    previous_points = @comment.points
    @comment.update(points: previous_points + 1)
    flash[:success] = 'You successfully upvoted the comment'
    redirect_to question_path(@comment.question)
  end


  def downvote

  end

  private
  def comments_params
    params.require(:comment).permit(:content)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
