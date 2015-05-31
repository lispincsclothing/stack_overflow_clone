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

  def destroy
    @question = Question.find(params[:question_id])
    Answer.find(params[:id]).destroy
    redirect_to question_path(@question)
  end

  def upvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.upvote
    redirect_to question_path(@question)
  end

  def downvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.downvote
    redirect_to question_path(@question)
  end

  def autocomplete
    render json: Answer.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end

  private

  def params_answer
    params.require(:answer).permit(:title, :content, :vote_count)
  end
end
