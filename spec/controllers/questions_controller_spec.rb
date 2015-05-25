require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      get :index
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'assigns the @questions instance variable' do
      # Interesting - ActiveRecord_Relation vs ActiveRecord-Relation
      expect(assigns :questions).to be_a(Question::ActiveRecord_Relation)
    end
  end

  describe 'GET #show' do
    let(:myquestion) { FactoryGirl.create :question }
    before(:each) do
      get :show, id: myquestion.id
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'assigns @question to requested question' do
      expect(assigns :question).to eq(myquestion)
    end
    it 'renders the show page template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'POST #create' do
    it 'create accepts valid questions' do
      form = { title: 'a long enough title', content: 'also long content' }
      expect {
        post :create, { question: form}
      }.to change { Question.count }.by(1)
    end
    it 'redirects to questions index page' do
      form = { title: 'a long enough title', content: 'also long content' }
      post :create, { question: form}
      #question_url is the same as question_path in rails
      expect(response).to redirect_to(questions_url)
    end
  end

  describe 'GET #new' do
    it 'renders the new question template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    let(:myquestion) { FactoryGirl.create :question }
    it "renders the #edit page" do
      get :edit, id: myquestion.id
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do

  end

  describe 'DELETE #destroy' do

  end
end
