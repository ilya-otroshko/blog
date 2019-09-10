class Like < ApplicationRecord
    belongs_to :liketable, polymorphic: true
end
