class Document < ApplicationRecord
    belongs_to :documentable, polymorphic: true
    
    mount_uploader :path, DocumentUploader
end
