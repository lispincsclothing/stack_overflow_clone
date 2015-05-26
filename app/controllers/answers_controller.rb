class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(params_answer)
    @answer.save
    redirect_to question_path(@question)
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(params_answer)
    redirect_to question_path(@question)
  end

  private

  def params_answer
    params.require(:answer).permit(:title, :content)
  end
end
