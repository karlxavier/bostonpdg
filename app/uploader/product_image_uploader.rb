class ProductImageUploader < Shrine
	include ImageProcessing::MiniMagick
	MIME_TYPES = [
		'image/jpg', 
		'image/jpeg', 
		'image/png', 
		'image/gif'
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