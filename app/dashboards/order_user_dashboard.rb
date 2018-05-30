require "administrate/base_dashboard"

class OrderUserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    regional:Field::CollectionSelect.with_options(
      collection: proc { User.all },
      value_method: :id,
      text_method: :first_name,
      options: {
      include_blank: 'Please Select A User',
      include_hidden: false,
  }
  ),
    comms: Field::CollectionSelect.with_options(
      collection: proc { User.all },
      value_method: :id,
      text_method: :first_name,
      options: {
      include_blank: 'Please Select A User',
      include_hidden: false,
  }
  ),
    art: Field::CollectionSelect.with_options(
      collection: proc { User.all },
      value_method: :id,
      text_method: :first_name,
      options: {
      include_blank: 'Please Select A User',
      include_hidden: false,
  }
  ),
    processor: Field::CollectionSelect.with_options(
      collection: proc { User.all },
      value_method: :id,
      text_method: :first_name,
      options: {
      include_blank: 'Please Select A User',
      include_hidden: false,
  }
  ),
    order_id: Field::Hidden,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :order_id,
    :regional,
    :comms,
    :art,
    :processor,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :order_id,
    :regional,
    :comms,
    :art,
    :processor,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :order_id,
    :regional,
    :comms,
    :art,
    :processor,
  ].freeze

  # Overwrite this method to customize how order users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order_user)
  #   "OrderUser ##{order_user.id}"
  # end
end
