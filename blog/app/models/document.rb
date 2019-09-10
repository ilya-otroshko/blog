class Document < ApplicationRecord
    belongs_to :documentable, polymorphic: true
    mount_uploaders :documents, ImageUploader
end
