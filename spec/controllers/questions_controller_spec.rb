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

  end

  describe 'GET #edit' do

  end

  describe 'PUT #update' do

  end

  describe 'DELETE #destroy' do

  end
end
