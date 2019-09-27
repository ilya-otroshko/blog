class Post < ApplicationRecord    
    belongs_to :user
<<<<<<< HEAD:blog/app/models/post.rb
    mount_uploaders :images, DocumentUploader
=======

>>>>>>> 4c79d09e397fcfaaf90c9eb5f4855965740cc079:app/models/post.rb
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :documents, as: :documentable, dependent: :destroy
    has_many :likes, as: :liketable, dependent: :destroy
    
    validates :title, presence: true 
<<<<<<< HEAD:blog/app/models/post.rb
=======
    accepts_nested_attributes_for :documents, allow_destroy: true

>>>>>>> 4c79d09e397fcfaaf90c9eb5f4855965740cc079:app/models/post.rb
end
