class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC')
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.create(get_params)
    redirect_to questions_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  private
  def get_params
    params.required(:question).permit(:title, :content)
  end
end
