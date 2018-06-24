require "shrine"
require "shrine/storage/s3"
require "image_processing/mini_magick"

Shrine.plugin :determine_mime_type

s3_options = {
  access_key_id:     ENV.fetch("S3_ACCESS_KEY"),
  secret_access_key: ENV.fetch("S3_SECRET_ACCESS"),
  region:            ENV.fetch("S3_REGION"),
  bucket:            ENV.fetch("S3_BUCKET_NAME"),
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
}

# require "shrine"
# require "shrine/storage/file_system"

# Shrine.storages = {
#     cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
#     store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
# }

# # Shrine.plugin :sequel # or :activerecord
# Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
# Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
# Shrine.plugin :rack_file # for non-Rails apps