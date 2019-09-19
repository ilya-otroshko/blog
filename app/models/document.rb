class Document < ApplicationRecord
    belongs_to :post
    belongs_to :documentable, polymorphic: true
    mount_uploader :document, DocumentUploader
end
