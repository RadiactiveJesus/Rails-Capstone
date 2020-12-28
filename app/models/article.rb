class Article < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "author_id"
    has_many :votes, dependent: :destroy
    belongs_to :category
    validates_presence_of :title, :text, :author_id
    validates_length_of :title, :text, { minimum: 6 }
    has_attached_file :avatar, styles: { medium: '200x200>', thumb: '50x50>' },
    default_url: '/images/:style/missing.png'
    validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}
    def self.featured_article
        return unless Vote.any?
        article_id = Vote.group(:article_id).count.max_by { |_k, v| v }.first
        Article.find(article_id)
    end

    def voted?(user)
        votes.find_by(user_id: user.id)
      end
end
