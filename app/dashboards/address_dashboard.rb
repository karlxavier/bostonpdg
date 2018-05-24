require "administrate/base_dashboard"

class AddressDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    street: Field::String,
    street_2: Field::String,
    city: Field::String,
    state: Field::String,
    zip: Field::String,
    country: Field::String,
    phone: Field::String,
    email: Field::String,
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
    :street,
    :street_2,
    :city,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :street,
    :street_2,
    :city,
    :state,
    :zip,
    :country,
    :phone,
    :email,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :street,
    :street_2,
    :city,
    :state,
    :zip,
    :country,
    :phone,
    :email,
  ].freeze

  # Overwrite this method to customize how addresses are displayed
  # across all pages of the admin dashboard.
  #
   def display_resource(address)
     (address.street.nil? ? '' : (address.street + ', ')) + (address.city.nil? ? '' : (address.city + ' ')) + (address.state.nil? ? '' : (address.state + ', ')) + (address.state.nil? ? '' : (address.state + ', ')) + (address.country.nil? ? '' : address.country)
   end
end
