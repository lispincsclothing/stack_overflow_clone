class Answer < ActiveRecord::Base
  belongs_to :question

  validates :title, :content, presence: true, length: {minimum: 6}
  validates :title, uniqueness: true
end
