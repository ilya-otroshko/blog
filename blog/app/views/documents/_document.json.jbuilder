json.extract! document, :id, :path, :documentable_id, :documentable_type, :created_at, :updated_at
json.url document_url(document, format: :json)
