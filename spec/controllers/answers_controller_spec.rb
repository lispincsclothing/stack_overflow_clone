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

  # describe 'GET #new' do
  #   it 'renders the new question template' do
  #     get :new
  #     expect(response).to render_template(:new)
  #   end
  # end

  describe 'GET #edit' do
    let(:myanswer) { FactoryGirl.create :answer }
    it "renders the #edit page" do
      # p myanswer, myanswer.id, myanswer.question
      get :edit, question_id: myanswer.question.id, id: myanswer.id
      expect(response).to render_template :edit
    end
  end

  # describe 'PATCH #update' do
  #   # Testing before each vs. let
  #   before(:each) do
  #     @question = FactoryGirl.create(:question)
  #   end
  #   it 'changes @question attribute' do
  #     put :update, id: @question.id, question: FactoryGirl.attributes_for(:question, title: 'New Title', content: 'New Body')
  #     @question.reload
  #     expect(@question.title).to eq('New Title')
  #     expect(@question.content).to eq('New Body')
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   # Replacing before with let! (have to use ! since needs to be evaluated before each it block)
  #   # http://stackoverflow.com/questions/5359558/when-to-use-rspec-let
  #   # before(:each) do
  #   #   @myquestion = FactoryGirl.create(:question)
  #   # end
  #   let!(:myquestion) { FactoryGirl.create :question }
  #   it 'redirects to questions index page' do
  #     delete :destroy, id: myquestion
  #     expect(response).to redirect_to questions_url
  #   end
  #   it 'deletes the question' do
  #     # Can use myquestion.id, or myquestion as above.
  #     expect { delete :destroy, id: myquestion.id }.to change(Question, :count).by(-1)
  #   end
end
