require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  before(:each) do
    # Using destroy_all rather than delete_all, otherwise gives foreign key error if associated answers exist
    # http://stackoverflow.com/questions/28996773/error-delete-on-table-violates-foreign-key-constraint-key-id-is-still-referenc
    Question.destroy_all
    @myquestion = Question.create!(title: 'testtitle', content: 'testcontent')
    @myanswer = @myquestion.answers.create!(title: 'testanswer', content: 'testcontent')
  end
  # GET #index tests - none, since route doesn't exist (same as question show page)

  # GET #show tests - none, since route doesn't exist (all answer contents on question show page)

  describe 'POST #create' do
    before :each do
      @form = { title: 'a long enough title', content: 'also long content' }
      post :create, question_id: @myquestion.id, answer: @form
    end
    it 'accepts valid answers' do
      expect(Answer.last.title).to eq(@form[:title])
    end
    it 'redirects to questions show page' do
      expect(response).to redirect_to(question_url(@myquestion))
    end
  end

  describe 'GET #edit' do
    let(:myanswer) { FactoryGirl.create :answer }
    it "renders the #edit page" do
      get :edit, question_id: myanswer.question.id, id: myanswer.id
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    it 'changes @answer attribute' do
      put :update, question_id: @myquestion.id, id: @myanswer.id, answer: {title: 'New Title', content: 'New Body'}
      expect(Answer.find(@myanswer.id).title).to eq('New Title')
    end
  end

  describe 'DELETE #destroy' do
    # Don't need below since already defined in before block above - kept for illustrative purposes (Factorygirl alternative)
    #  before(:each) do
    #   @question = FactoryGirl.create(:question)
    #   @answer = FactoryGirl.create(:answer)
    #   @question.answers << @answer
    # end
    it 'deletes the answer' do
      expect { delete :destroy, question_id: @myquestion.id, id: @myanswer.id }.to change(Answer, :count).by(-1)
    end
    it 'redirects to question show page' do
      delete :destroy, question_id: @myquestion.id, id: @myanswer.id
      expect(response).to redirect_to question_url(@myquestion)
    end
  end
  # Upvote and downvote tests
  describe 'POST #upvote' do
    before(:each) do
      @question = FactoryGirl.create(:question)
      @answer = @question.answers.create(FactoryGirl.attributes_for(:answer))
    end
    it "adds a vote to the vote count" do
      expect{
        post :upvote, question_id: @question.id, id: @answer
        # Active Record Reload!!
        (@answer).reload
      }.to change(@answer, :vote_count).by(1)
    end
    it "redirects to the question page" do
      post :upvote, question_id: @question.id, id: @answer
      expect(response).to redirect_to(question_url(@question))
    end
  end
  describe 'POST #downvote' do
    before(:each) do
      @question = FactoryGirl.create(:question)
      @answer = @question.answers.create(FactoryGirl.attributes_for(:answer))
    end

    it "subtracts a vote from the vote count" do
    post :upvote, question_id: @question.id, id: @answer
    post :downvote, question_id: @question.id, id: @answer

    (@answer).reload
    # Active Record Reload!!
    expect(@answer.vote_count).to eq(0)
    end

    it "redirects to the question page" do
    post :upvote, question_id: @question.id, id: @answer
    expect(response).to redirect_to(question_url(@question))
    end
  end
end
