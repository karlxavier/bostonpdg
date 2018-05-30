require "administrate/base_dashboard"

class OrderBranchDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
      id: Field::Number,
      address_id: Field::CollectionSelect.with_options(
      collection: proc { Address.all },
      value_method: :id,
      text_method: :state_and_city,
      options: {
      include_blank: 'Please Select A/Some Address',
      include_hidden: false,
  }
  ),
      brand_id: Field::Hidden,
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
      :id,
      :address_id,
      :brand_id,
      :order_id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
      :id,
      :address_id,
      :brand_id,
      :order_id,
      :created_at,
      :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
      :address_id,
      :brand_id,
      :order_id,
  ].freeze

  # Overwrite this method to customize how order branches are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order_branch)
  #   "OrderBranch ##{order_branch.id}"
  # end
end
