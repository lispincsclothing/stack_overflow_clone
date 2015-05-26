class QuestionsController < ApplicationController
include ZenQuote
  def index
    @quote = get_quote
    @questions = Question.order('created_at DESC')
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order('created_at DESC')
  end

  def create
    @question = Question.create(params_question)
    redirect_to questions_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(params_question)
    redirect_to question_path(@question)
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to questions_path
  end

  def upvote
    @question = Question.find(params[:id])
    @question.upvote
    redirect_to questions_path
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote
    redirect_to questions_path
  end

  private

  def params_question
    params.require(:question).permit(:title, :content, :vote_count)
  end
end
