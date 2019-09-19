class Post < ApplicationRecord    
    belongs_to :user
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :documents, dependent: :destroy
    has_many :likes, as: :liketable, dependent: :destroy
    validates :title, presence: true 
    accepts_nested_attributes_for :documents, allow_destroy: true

end
