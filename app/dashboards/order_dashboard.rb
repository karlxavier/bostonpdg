require "administrate/base_dashboard"

class OrderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    created_by: Field::CollectionSelect.with_options(
      collection: proc { User.all },
      value_method: :id,
      text_method: :first_name,
      options: {
      include_blank: 'Please Select A User',
      include_hidden: false,
  }
  ),
    status: Field::String,
    customer: Field::Number,
    delivery_address: Field::CollectionSelect.with_options(
      collection: proc { Address.all },
      value_method: :id,
      text_method: :street,
      options: {
      include_blank: 'Please Select A/Some Address',
      include_hidden: false,
  }
  ),
    payment_address: Field::CollectionSelect.with_options(
      collection: proc { Address.all },
      value_method: :id,
      text_method: :street,
      options: {
      include_blank: 'Please Select A/Some Address',
      include_hidden: false,
  }
  ),
    total_cost: Field::String.with_options(searchable: false),
    total_tax: Field::String.with_options(searchable: false),
    total_discount: Field::String.with_options(searchable: false),
    margin: Field::String.with_options(searchable: false),
    last_updated_by: Field::CollectionSelect.with_options(
      collection: proc { User.all },
      value_method: :id,
      text_method: :first_name,
      options: {
      include_blank: 'Please Select A User',
      include_hidden: false,
  }
  ),
    promise_date: Field::DateTime,
    notes: Field::String,
    fulfillment_date: Field::DateTime,
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
    :created_by,
    :status,
    :customer,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :created_by,
    :status,
    :customer,
    :delivery_address,
    :payment_address,
    :total_cost,
    :total_tax,
    :total_discount,
    :margin,
    :last_updated_by,
    :promise_date,
    :notes,
    :fulfillment_date,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :created_by,
    :status,
    :customer,
    :delivery_address,
    :payment_address,
    :total_cost,
    :total_tax,
    :total_discount,
    :margin,
    :last_updated_by,
    :promise_date,
    :notes,
    :fulfillment_date,
  ].freeze

  # Overwrite this method to customize how orders are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order)
  #   "Order ##{order.id}"
  # end
end
