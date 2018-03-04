class Category < ApplicationRecord
  has_many :article_categories, dependent: :destroy
  has_many :articles, through: :article_categories
  
  # Validate the presence of a name and its min/max length
  validates :name, presence: true,
            uniqueness: { case_sensitive: false },
            length: {minimum: 3, maximum: 25 }
  
end
