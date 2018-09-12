class Hotel < ApplicationRecord
	belongs_to :brand
	belongs_to :address
	has_many :order_branches
	has_many :orders, through: :order_branches

	validates :name, :brand_id, presence: true
	validates :name, uniqueness: true

	scope :hotel_with_brands, -> { includes(:brand) }

	extend FriendlyId
  	friendly_id :name, use: [:slugged, :finders]

  	def should_generate_new_friendly_id?
		name_changed?
	end

	require 'csv'

  	def self.import(file)
  		spreadsheet= open_spreadsheet(file)
	    spreadsheet.default_sheet = spreadsheet.sheets[0]

	    headers = Hash.new
	    spreadsheet.row(1).each_with_index {|header,i|headers[header] = i}
	    ((spreadsheet.first_row + 1)..spreadsheet.last_row).each do |row|
	      
	    	name = spreadsheet.row(row)[headers['Hotel']]

	    	hotel = Hotel.new
	    	hotel.name = name

	    	brand = Brand.find_by_name(name)
	    	if !brand.present? && !name.nil?
	    		Brand.create(name: name)
        		hotel.brand_id = Brand.last.id
	    	elsif brand.present?
	    		hotel.brand_id = brand.id
	    	end

	    	hotel.save

	    end
    
    end
  

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new (file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
