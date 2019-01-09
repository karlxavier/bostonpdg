class AttachmentUploader < Shrine
	include ImageProcessing::MiniMagick
	MIME_TYPES = [
		'image/jpg', 
		'image/jpeg', 
		'image/png', 
		'image/gif', 
		'text/plain', 
		'application/pdf', 
		'application/x-rar-compressed', 
		'application/x-7z-compressed', 
		'application/zip', 
		'application/x-tar', 
		'image/tiff', 
		'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.ms-powerpoint', 'application/vnd.openxmlformats-officedocument.presentationml.presentation',
		'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
		'application/msword',
		'text/csv'
	].freeze

	plugin :activerecord
  	plugin :determine_mime_type
  	plugin :logging, logger: Rails.logger
  	plugin :remove_attachment
  	plugin :store_dimensions
  	plugin :validation_helpers
  	plugin :processing
  	plugin :versions
	plugin :versions, names: [:original]
	plugin :metadata_attributes, filename: :original_filename

  	Attacher.validate do
    	validate_max_size 5.megabytes, message: 'is too large (max is 5 MB)'
    	validate_mime_type_inclusion MIME_TYPES
  	end

  	def process(io, context)
    	case context[:phase]
    		when :store
      			# thumb = resize_to_limit!(io.download, 200, 200)
      			# { original: io, thumb: thumb }

      			{ original: io}
    	end
  	end
end