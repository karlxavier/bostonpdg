module OrderHelper

	def check_image_url entry 
		if entry.product.present?
			if  entry.product.image_url.present?
			   entry.product.image_url(:original)
			else
			  nil
			end	
		else
			nil	
		end	
	end	
end
