class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  
  validates :text, presence: true,
            length: {minimum: 5, maximum: 1200}
  
  validates :user_id, presence: true
  validates :article_id, presence: true
end
