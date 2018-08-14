# == Schema Information
#
# Table name: vendors
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  lead_time       :integer
#  country_origin  :string
#  product_id      :bigint(8)
#  email           :string
#  billing_address :integer
#

class Vendor < ApplicationRecord
  require 'csv'
  
  has_many :vendors_products
  has_many :products, through: :vendors_products

  has_many :vendor_categories
  has_many :categories, through: :vendor_categories

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    return "#{self.email}"
    #if false
    #return nil
  end
  def notification_email(object)
    #Check if an email should be sent for that object
    #if true
    return "#{self.email}"
    #if false
    #return nil
  end

  require 'csv'

  def self.import(file)

    spreadsheet= open_spreadsheet(file)
    header=spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row=Hash[[header,spreadsheet.row(i)].transpose]
      puts "#{row.to_json}"
      temp_vendor = Vendor.find_by_name(row["name"])
      if !temp_vendor.present?
        @address = Address.where(:street => row['Bill from 1'], :street_2 => row['Bill from 2']).first

        if !@address.present?
          @address = Address.new
          @address.street = row['Bill from 1']
          @address.street_2 = row['Bill from 2']
          @arr1 = []
          @arr2 = []
          if row['Bill from 3'].present? && row['Bill from 3'] != ''
            @arr1 = row['Bill from 3'].split(', ')
            if @arr1.length > 0
              @address.city = @arr1[0]
            end
            if @arr1[1].present?
              @arr2 = @arr1[1].split(' ')
              if @arr2.length > 0
                @address.state = @arr2[0]
                if @arr2[1].present? && !@arr2[1].nil?
                  @address.zip = @arr2[0]
                end
              end
            end
          end
          if row['Main Phone'].present? && row['Main Phone'] != ''
            @address.phone = row['Main Phone']
          end
          @address.save
        end

        vendor = Vendor.new
        vendor.name = row["Vendor"]
        if @address.present?
          vendor.billing_address = @address.id
        end
        vendor.save
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new (file.path nil, :ignore)
      when ".xls" then Roo::Excel.new (file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
