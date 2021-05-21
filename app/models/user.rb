class User < ApplicationRecord
  attr_accessor :login
  validates :username, presence: true, uniqueness: true
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

  # Serialize string instead of BSON
  def self.serialize_into_session(record)
    [record.to_key.map(&:to_s), record.authenticatable_salt]
  end

  # Serialize string instead of BSON
  def self.serialize_into_cookie(record)
    [record.to_key.map(&:to_s), record.rememberable_value]
  end
     
end
