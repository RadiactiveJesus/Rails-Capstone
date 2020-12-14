class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :votes, dependent: :destroy
  has_many :articles, foreign_key: 'author_id', class_name: 'Article'

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
