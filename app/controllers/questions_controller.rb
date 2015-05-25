class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC')
  end

  def show
    @question = Question.find(params[:id])
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

  private

  def params_question
    params.require(:question).permit(:title, :content)
  end
end
