require "administrate/base_dashboard"

class InventoryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    product_id:  Field::CollectionSelect.with_options(
      collection: proc { Product.all },
      value_method: :id,
      text_method: :name,
      options: {
      include_blank: 'Please Select A/Some Product',
      include_hidden: false,
  }
  ),
    loc_id: Field::Number,
    bin_id: Field::Number,
    aisle_id: Field::Number,
    quantity: Field::Number,
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
    :product_id,
    :loc_id,
    :bin_id,
    :quantity,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :product_id,
    :loc_id,
    :bin_id,
    :aisle_id,
    :quantity,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :product_id,
    :loc_id,
    :bin_id,
    :aisle_id,
    :quantity,
  ].freeze

  # Overwrite this method to customize how inventories are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(inventory)
  #   "Inventory ##{inventory.id}"
  # end
end
