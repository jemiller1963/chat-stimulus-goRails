require 'shrine/storage/s3'

s3_options = {
  bucket:            'ink3',
  access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),
  secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
  region:            'us-east-1'
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: 'cache', upload_options: {acl: 'public-read'}, **s3_options),
  store: Shrine::Storage::S3.new(prefix: 'store', upload_options: {acl: 'public-read'}, **s3_options),
}

Shrine.plugin :presign_endpoint, presign_options: -> (request) {
  # Uppy will send the "filename" and "type" query parameters
  filename = request.params["filename"]
  type     = request.params["type"]

  {
    content_disposition:    ContentDisposition.inline(filename), # set download filename
    content_type:           type,                                # set content type (defaults to "application/octet-stream")
    content_length_range:   0..(10*1024*1024),                   # limit upload size to 10 MB
  }
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :validation
Shrine.plugin :validation_helpers
Shrine.plugin :model
Shrine.plugin :derivatives
