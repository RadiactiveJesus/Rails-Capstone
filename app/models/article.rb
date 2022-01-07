class Article < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :votes, class_name: 'Vote', dependent: :destroy
  has_one_attached :image
  belongs_to :category, foreign_key: 'category_id'
  has_many :article_categories, foreign_key: 'article_id'
  has_many :categories, through: :article_categories, dependent: :destroy
  validates_presence_of :title, :text, :author_id
  validates_length_of :title, :text, { minimum: 6 }

  def voted?(user)
    votes.find_by(user_id: user.id)
  end
end
