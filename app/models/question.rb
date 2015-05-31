class Question < ActiveRecord::Base
  searchkick autocomplete: ['title']
  has_many :answers, dependent: :destroy

  validates :title, :content, presence: true, length: { minimum: 6 }
  validates :title, uniqueness: true

  validates :vote_count, numericality: {greater_than_or_equal_to: 0}

  def upvote
    update_attributes(vote_count: vote_count + 1)
  end

  def downvote
    update_attributes(vote_count: vote_count - 1)
  end
end
