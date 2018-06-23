require "administrate/base_dashboard"

class CustomerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    email: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    billing_address: Field::String,
    shipping_address: Field::String,
    phone: Field::String,
      brand: Field::CollectionSelect.with_options(
      collection: proc { Brand.all },
      value_method: :id,
      text_method: :name,
      options: {
      include_blank: 'Please Select A Brand',
      include_hidden: false,
  }
  ),
    admin: Field::Boolean,
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
    :name,
    :email,
    :billing_address,
    :shipping_address,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :email,
    :first_name,
    :last_name,
    :billing_address,
    :shipping_address,
    :phone,
    :brand,
    :admin,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :first_name,
    :last_name,
    :email,
    :billing_address,
    :shipping_address,
    :phone,
    :brand,
    :admin,
  ].freeze

  # Overwrite this method to customize how customers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(customer)
  #   "Customer ##{customer.id}"
  # end
end
