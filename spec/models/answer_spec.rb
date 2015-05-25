require 'rails_helper'

RSpec.describe Answer, type: :model do
  context '#associations' do
    it { should belong_to :question }
  end

  context '#validations' do
    it 'is valid with title and content' do
      answer = Answer.new(title: 'a full title', content: 'full content')
      expect(answer).to be_valid
    end
    it 'is invalid without title' do
      answer = Answer.new(content: 'full content')
      expect(answer).to be_invalid
    end
    it 'invalid without content' do
      answer = Answer.new(title: 'a full title')
      expect(answer).to be_invalid
    end
    it 'is invalid with short title length (less than 6 chars)' do
      answer = Answer.new(title: '1', content: 'full content')
      expect(answer).to be_invalid
    end
    it 'is invalid with short content length (less than 6 chars)' do
      answer = Answer.new(title: 'a full title', content: '1')
      expect(answer).to be_invalid
    end
    it 'is invalid with duplicate title' do
      answer_one = Answer.create(title: 'a full new title', content: 'full content')
      answer_two = Answer.create(title: 'a full new title', content: 'full content')
      expect(answer_two).to be_invalid
    end
  end

  context '#metatests' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:question)).to be_valid
    end
  end
end
