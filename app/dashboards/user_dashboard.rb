require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
      brands: Field::HasMany,
      groups: Field::HasMany,
      id: Field::Number,
      email: Field::String,
      password: Field::Password,
      password_confirmation: Field::Password,
      admin: Field::Boolean,
      billing_address: Field::CollectionSelect.with_options(
      collection: proc { Address.all },
      value_method: :id,
      text_method: :street,
      options: {
      include_blank: 'Please Select A/Some Address',
      include_hidden: false,
  }
  ),
      shipping_address: Field::CollectionSelect.with_options(
      collection: proc { Address.all },
      value_method: :id,
      text_method: :street,
      options: {
      include_blank: 'Please Select A/Some Address',
      include_hidden: false,
  }
  ),
      first_name: Field::String,
      last_name: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
      :id,
      :first_name,
      :last_name,
      :email,
      :billing_address,
      :shipping_address,
      :brands,
      :groups,
      :admin
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
      :id,
      :first_name,
      :last_name,
      :email,
      :billing_address,
      :shipping_address,
      :brands,
      :groups,
      :admin
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
      :first_name,
      :last_name,
      :billing_address,
      :shipping_address,
      :email,
      :password,
      :password_confirmation,
      :admin,
      :brands,
      :groups
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
