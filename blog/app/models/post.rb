class Post < ApplicationRecord    
    belongs_to :user
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :likes, as: :liketable, dependent: :destroy
    has_many :documents, as: :documentable, dependent: :destroy
    validates :title, presence: true 

end
