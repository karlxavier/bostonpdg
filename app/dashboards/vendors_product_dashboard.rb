require "administrate/base_dashboard"

class VendorsProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    vendor_id: Field::Hidden,
      product_id: Field::CollectionSelect.with_options(
      collection: proc { Product.all },
      value_method: :id,
      text_method: :name,
      options: {
      include_blank: 'Please Select A Product',
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
    :vendor_id,
    :product_id,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :vendor_id,
    :product_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :vendor_id,
    :product_id,
  ].freeze

  # Overwrite this method to customize how vendors products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(vendors_product)
  #   "VendorsProduct ##{vendors_product.id}"
  # end
end
