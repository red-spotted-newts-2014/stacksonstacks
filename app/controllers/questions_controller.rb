class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
  	@question = Question.find(params[:id])
    @comments = @question.comments
  end

  def new
  	@question = Question.new
  end

  def edit
  	@question = Question.find(params[:id])
  end

  def create
  	@question = Question.create(question_params)
    render :show
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def upvote
    @question = Question.find(params[:id])
    @question.liked_by current_user
    redirect_to question_path(@question)
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote_from current_user
    redirect_to question_path(@question)
  end

  private

  def question_params
  	params.require(:question).permit(:title, :body)
  end
end

