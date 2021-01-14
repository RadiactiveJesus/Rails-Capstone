class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, class_name: 'Article', foreign_key: 'author_id'
  has_many :votes, foreign_key: 'user_id', class_name: 'Vote', dependent: :destroy
  has_many :voted_articles, through: :votes, source: 'article'

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def password_required?
    false
  end

  def password_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
     
end
