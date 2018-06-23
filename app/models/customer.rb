class Customer < ApplicationRecord

  require 'csv'

  def self.import(file)

    spreadsheet= open_spreadsheet(file)
    header=spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row=Hash[[header,spreadsheet.row(i)].transpose]
      temp_customer = Customer.find_by_name(row['Customer'])
      if !temp_customer.present?

        @customer = Customer.new

        if row['Company'].present? && row['Company'] != ''
          brand = Brand.find_by_name(row['Company'])
          if !brand.present?
            brand = Brand.new
            brand.name = row['Company']
            if brand.save
              @customer.brand = brand.id
          end
          else
            @customer.brand = brand.id
          end

        end
        if row['Customer'].present? && row['Customer'] != ''
          @customer.name = row['Customer']
        end
        if row['First Name'].present? && row['First Name'] != ''
          @customer.first_name = row['First Name']
        end
        if row['Last Name'].present? && row['Last Name'] != ''
          @customer.last_name = row['Last Name']
        end
        if row['Bill to 1'].present? && row['Bill to 1'] != ''
          @customer.billing_address =  row['Bill to 1']
        end
        if row['Bill to 2'].present? && row['Bill to 2'] != ''
          @customer.billing_address = @customer.billing_address + ' ' + row['Bill to 2']
        end
        if row['Bill to 3'].present? && row['Bill to 3'] != ''
          @customer.billing_address = @customer.billing_address + ' ' + row['Bill to 3']
        end
        if row['Ship to 1'].present? && row['Ship to 1'] != ''
          @customer.shipping_address = row['Ship to 1']
        end
        if row['Ship to 2'].present? && row['Ship to 2'] != ''
          @customer.shipping_address = @customer.shipping_address + ' ' + row['Ship to 2']
        end
        if row['Ship to 3'].present? && row['Ship to 3'] != ''
          @customer.shipping_address = @customer.shipping_address + ' ' + row['Ship to 3']
        end
        if row['Main Phone'].present? && row['Main Phone'] != ''
          @customer.phone = row['Main Phone']
        end
        if row['Main Email'].present? && row['Main Email'] != ''
          @customer.email = row['Main Email']
        end

        @customer.save
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
