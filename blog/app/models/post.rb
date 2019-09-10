class Post < ApplicationRecord    
    belongs_to :user
    has_many :comments, as: :commentable
    has_many :likes, as: :liketable
    has_many :documents, as: :documentable
    validates :title, presence: true 

end
