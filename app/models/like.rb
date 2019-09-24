class Like < ApplicationRecord
    belongs_to :user
    belongs_to :liketable, polymorphic: true
    
    validates :user_id, uniqueness: { scope: %i[liketable_type liketable_id],
        message: 'Already liked' }
end
