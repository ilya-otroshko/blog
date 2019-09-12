class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :liketable, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy
  validates :body, presence: true 
  
end