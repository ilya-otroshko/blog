class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :likes, as: :liketable
  has_many :documents, as: :documentable
  validates :body, presence: true 
end