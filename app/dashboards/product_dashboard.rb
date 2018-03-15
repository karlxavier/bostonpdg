require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
      style_attributes: Field::HasMany,
      id: Field::Number,
      name: Field::String,
      approval_status: Field::String,
      online_date: Field::DateTime,
      offline_date: Field::DateTime,
      unit: Field::String,
      description: Field::String,
      base_product: Field::String,
      category: Field::CollectionSelect.with_options(
      collection: proc { Category.all },
      value_method: :id,
      text_method: :name,
      options: {
      include_blank: 'Please Select A Category',
      include_hidden: false,
  }
  ),
      price: Field::String.with_options(searchable: false),
      picture: Field::Paperclip,
      variant_type: Field::String,
      style: Field::String,
      variants: Field::String,
      force_in_stock: Field::Boolean,
      created_at: Field::DateTime,
      updated_at: Field::DateTime,
      vendor_id: Field::Number,
      style_attribute_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
      :style_attributes,
      :id,
      :name,
      :approval_status,
      :style_attributes
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
      :id,
      :name,
      :approval_status,
      :online_date,
      :offline_date,
      :unit,
      :description,
      :base_product,
      :category,
      :price,
      :picture,
      :style,
      :variants,
      :force_in_stock,
      :created_at,
      :updated_at,
      :style_attributes
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
      :name,
      :approval_status,
      :online_date,
      :offline_date,
      :unit,
      :description,
      :base_product,
      :category,
      :price,
      :picture,
      :variant_type,
      :style,
      :variants,
      :force_in_stock,
      :style_attributes
  ].freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product)
  #   "Product ##{product.id}"
  # end
  def display_resource(product)
    product.name
  end
end
