class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(params_answers)
    @answer.save
    redirect_to question_path(@question)
  end

  private

  def params_answers
    params.require(:answer).permit(:title, :content)
  end
end
