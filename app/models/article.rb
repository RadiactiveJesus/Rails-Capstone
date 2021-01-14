class Article < ApplicationRecord
    attr_accessor :category_id
    belongs_to :user, class_name: "User", foreign_key: "author_id"
    has_many :votes, foreign_key: 'article_id', class_name: 'Vote', dependent: :destroy
    has_one_attached :image
    belongs_to :category
    validates_presence_of :title, :text, :author_id
    validates_length_of :title, :text, { minimum: 6 }
    def self.featured_article
        return unless Vote.any?
        article_id = Vote.group(:article_id).count.max_by { |_k, v| v }.first
        Article.find(article_id)
    end

    def voted?(user)
        votes.find_by(user_id: user.id)
    end
end
