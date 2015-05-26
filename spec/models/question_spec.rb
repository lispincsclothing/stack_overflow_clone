require 'rails_helper'

RSpec.describe Question, type: :model do
  context "#associations" do
    it {should have_many :answers}
  end

  context '#validations' do
    it 'is valid with title and content' do
      question = Question.create(title: 'a full title', content: 'full content')
      expect(question).to be_valid
    end
    it 'is invalid without title' do
      question = Question.create(content: 'full content')
      expect(question).to be_invalid
    end
    it 'invalid without content' do
      question = Question.create(title: 'a full title')
      expect(question).to be_invalid
    end
    it 'is invalid with short title length (less than 6 chars)' do
      question = Question.create(title: '1', content: 'full content')
      expect(question).to be_invalid
    end
    it 'is invalid with short content length (less than 6 chars)' do
      question = Question.create(title: 'a full title', content: '1')
      expect(question).to be_invalid
    end
    it 'is invalid with duplicate title' do
      question_one = Question.create(title: 'a full new title', content: 'full content')
      question_two = Question.create(title: 'a full new title', content: 'full content')
      expect(question_two).to be_invalid
    end
    it "destroys dependent answers" do
      question_one = Question.create(title: 'a full new title', content: 'full content')
      question_one.answers.create(title: 'a full title', content: 'full content')
      expect { question_one.destroy }.to change { Answer.count }.by(-1)
    end
    it 'is invalid when vote_count set to less than 0' do
      question = Question.create(title: 'a full new title', content: 'full content', vote_count:-1)
      expect(question).to be_invalid
    end
    it 'is false and does not set votecount when downvote operation results in vote_count being less 0' do
      question = Question.create(title: 'a full new title', content: 'full content')
      expect(question.downvote).to be_falsey
    end
  end

  context '#metatests' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:question)).to be_valid
    end
  end
end
