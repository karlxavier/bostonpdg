module OrderHelper

	def check_image_url entry 
		if entry.product.present?
			if entry.product.picture.url.present?
			   entry.product.picture.url(:original)
			else
			  nil
			end	
		else
			nil	
		end	
	end	
end
