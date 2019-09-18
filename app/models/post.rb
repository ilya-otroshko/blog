class Post < ApplicationRecord    
    belongs_to :user
    mount_uploader :image, DocumentUploader
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :likes, as: :liketable, dependent: :destroy
    validates :title, presence: true 

end
