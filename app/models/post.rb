

class Post < ApplicationRecord   
    belongs_to :user

    has_many :comments, as: :commentable, dependent: :destroy
    has_many :documents, as: :documentable, dependent: :destroy
    has_many :likes, as: :liketable, dependent: :destroy
    
    validates :title, presence: true
    validates :body, presence: true 
    accepts_nested_attributes_for :documents, allow_destroy: true

    scope :search_by_fullname, -> (input) {
    input = input.split(' ').map { |word| word.capitalize }.join(' ')
    Post.where("CONCAT_WS(' ', title, body) LIKE ? or CONCAT_WS(' ', body, title) LIKE ?", "%#{input}%", "%#{input}%")

  }

end
