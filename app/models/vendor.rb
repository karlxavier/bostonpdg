class Vendor < ApplicationRecord
  require 'csv'
  has_many :products

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
      temp_vendor = Vendor.find_by_name(row["name"])
      if !temp_vendor.present?
        vendor = Vendor.new
        vendor.name = row["name"]
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
