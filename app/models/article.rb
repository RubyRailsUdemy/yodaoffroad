class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  
  validates :title, presence: true,
            length: {minimum: 5, maximum: 50}
            
  validates :description, presence: true,
            length: {minimum: 10, maximum: 10000}
  
  validates :user_id, presence: true
end
