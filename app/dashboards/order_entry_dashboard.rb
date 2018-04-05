require "administrate/base_dashboard"

class OrderEntryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    order_id: Field::Number,
    product_id: Field::CollectionSelect.with_options(
      collection: proc { Product.all },
      value_method: :id,
      text_method: :name,
      options: {
      include_blank: 'Please Select a Product',
      include_hidden: false,
  }
  ),
    price: Field::String.with_options(searchable: false),
    cost: Field::String.with_options(searchable: false),
    tax: Field::String.with_options(searchable: false),
    quoted_by: Field::CollectionSelect.with_options(
      collection: proc { User.all },
      value_method: :id,
      text_method: :first_name,
      options: {
      include_blank: 'Please Select a User',
      include_hidden: false,
  }
  ),
    quantity: Field::Number,
    vendor: Field::CollectionSelect.with_options(
      collection: proc { Vendor.all },
      value_method: :id,
      text_method: :name,
      options: {
      include_blank: 'Please Select a Vendor',
      include_hidden: false,
  }
  ),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :order_id,
    :product_id,
    :price,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :order_id,
    :product_id,
    :price,
    :cost,
    :tax,
    :quoted_by,
    :quantity,
    :vendor,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :order_id,
    :product_id,
    :price,
    :cost,
    :tax,
    :quoted_by,
    :quantity,
    :vendor,
  ].freeze

  # Overwrite this method to customize how order entries are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order_entry)
  #   "OrderEntry ##{order_entry.id}"
  # end
end
