# == Schema Information
#
# Table name: customers
#
#  id               :bigint(8)        not null, primary key
#  first_name       :string
#  last_name        :string
#  billing_address  :string
#  shipping_address :string
#  phone            :string
#  brand            :integer
#  admin            :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name             :string
#  email            :string
#  status           :string
#  manage_by        :integer
#  owned_by         :integer
#  po_required      :boolean
#  payment_terms    :text
#  notes            :text
#  website          :string
#

class Customer < ApplicationRecord
  has_many :orders
  belongs_to :brand
  # audited

  # validates :first_name, :last_name, :email, presence: true

  scope :customer_with_brands, -> { includes(:brand) }

  def customer_fullname
    "#{first_name} #{last_name}"
  end

  require 'csv'

  def self.import(file)

    spreadsheet= open_spreadsheet(file)
    spreadsheet.default_sheet = spreadsheet.sheets[0]

    headers = Hash.new
    spreadsheet.row(1).each_with_index {|header,i|headers[header] = i}
    ((spreadsheet.first_row + 1)..spreadsheet.last_row).each do |row|
      
      customer = spreadsheet.row(row)[headers['Customer']]
      company = spreadsheet.row(row)[headers['Company']]
      phone = spreadsheet.row(row)[headers['Main Phone']]
      fax = spreadsheet.row(row)[headers['Fax']]
      email = spreadsheet.row(row)[headers['Main Email']]
      balance = spreadsheet.row(row)[headers['Balance']]
      balance_total = spreadsheet.row(row)[headers['Balance Total']]
      bill_1 = spreadsheet.row(row)[headers['Bill to 1']]
      bill_2 = spreadsheet.row(row)[headers['Bill to 2']]
      bill_3 = spreadsheet.row(row)[headers['Bill to 3']]
      bill_4 = spreadsheet.row(row)[headers['Bill to 4']]
      bill_5 = spreadsheet.row(row)[headers['Bill to 5']]
      ship_1 = spreadsheet.row(row)[headers['Ship to 1']]
      ship_2 = spreadsheet.row(row)[headers['Ship to 2']]
      ship_3 = spreadsheet.row(row)[headers['Ship to 3']]
      ship_4 = spreadsheet.row(row)[headers['Ship to 4']]
      ship_5 = spreadsheet.row(row)[headers['Ship to 5']]
      terms = spreadsheet.row(row)[headers['Terms']]
      rep = spreadsheet.row(row)[headers['Rep']]
      sales_tax_code = spreadsheet.row(row)[headers['Sales Tax Code']]
      tax_item = spreadsheet.row(row)[headers['Tax item']]

      cust = Customer.new

      brand = Brand.find_by_name(company)
      if !brand.present? && !company.nil?
        Brand.create(name: company)
        cust.brand_id = Brand.last.id
      elsif brand.present?
        cust.brand_id = brand.id
      end

      cust.name = customer
      cust.phone = phone
      cust.fax = fax
      cust.email = email
      cust.balance = balance
      cust.balance_total = balance_total
      cust.bill_1 = bill_1
      cust.bill_2 = bill_2
      cust.bill_3 = bill_3
      cust.bill_4 = bill_4
      cust.bill_5 = bill_5
      cust.ship_1 = ship_1
      cust.ship_2 = ship_2
      cust.ship_3 = ship_3
      cust.ship_4 = ship_4
      cust.ship_5 = ship_5
      cust.terms = terms
      cust.rep = rep
      cust.sales_tax_code = sales_tax_code
      cust.tax_item = tax_item

      cust.save
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
