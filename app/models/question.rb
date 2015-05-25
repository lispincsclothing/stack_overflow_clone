class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy

  validates :title, :content, presence: true, length: { minimum: 6 }
  validates :title, uniqueness: true
end
